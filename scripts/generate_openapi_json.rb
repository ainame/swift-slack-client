#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'yaml'
require_relative './lib/visitors'
require_relative './lib/helpers'

# https://github.com/slack-edge/slack-web-api-client/blob/4d1d93df8abe423ea7ee3b18591cd83d9bcfe6e6/scripts/code_generator.rb#L91-L115
UNSUPPORTED_METHODS = [
  /admin\.analytics\.getFile/,
  /api\.test/,
  /oauth\.access/,
  /oauth\.token/,
  /files\.comments\./,
  /dialog\./,
  /calls\./,
  /workflows\./,
  /channels\./,
  /groups\./,
  /mpim\./,
  /im\./
]

api_ref_dir = './tmp/slack-api-ref/methods/'
api_ref_paths = Dir.glob("#{api_ref_dir}/**/*.json")

json_logs = './tmp/java-slack-sdk/json-logs'
api_dir = "#{json_logs}/samples/api/"
sample_json_paths = Dir.glob("#{api_dir}*.json")

output_dir = './tmp'
FileUtils.mkdir_p(File.join(output_dir, 'schemas'))

def main(api_ref_paths, sample_json_paths, output_dir)
  openapi = JSON.parse(File.read(File.join(__dir__, 'lib/base_openapi.json')))

  # Generate schemas by quicktype
  process_in_queue(sample_json_paths) do |path|
    generate_openapi_component(path, File.join(output_dir, 'schemas'))
  end

  # Load generated schemas and put them in #components/schemas section
  schema_paths = Dir.glob("#{output_dir}/schemas/*.json")
  schema_paths.each do |path|
    json = JSON.parse(File.read(path))
    openapi['components']['schemas'].merge!(json['definitions'])
  end

  # Generate paths
  paths = {}
  api_ref_paths.each do |path|
    # endpoints that doesn't have sample response json isn't supported for now.
    method_name = File.basename(path, '.json')
    unless schema_paths.any? { File.basename(_1, '.json') == method_name }
      puts "Skip, this method doesn't have response schema #{method_name}"
      next
    end

    result = generate_openapi_path(path)
    paths.merge!(result) if result
  end
  openapi['paths'] = paths

  adjust_schemas(openapi)
  remove_orphan_schemas(openapi)

  # Output openapi_yaml
  File.write(File.join(output_dir, 'openapi.json'), JSON.pretty_generate(openapi))
end

def generate_openapi_component(path, output_dir)
  method_name = File.basename(path, '.json')
  return puts "Skip, this method isn't supported #{method_name}" if UNSUPPORTED_METHODS.include?(method_name)

  model_name = "#{method_name.split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"
  output_path = File.join(output_dir, "#{method_name}.json")

  if File.exist?(output_path)
    puts "Found #{path} exists. Skip generating schema."
  else
    command = 'npx quicktype --lang schema' \
              ' --all-properties-optional' \
              " --top-level #{model_name}" \
              " #{path}" \
              " > #{output_path}"
    puts "Generating schema: $ #{command}"
    system(command)
  end

  # fix json
  json = JSON.parse(File.read(output_path))
  visitors = [
    ReferenceFixer.new,
    SnakeCaseToCamelCaseConverter.new,
    OptionalityFixer.new,
    AcronymsFixer.new('DND' => 'Dnd'),
  ]
  visitors.each do |visitor|
    visitor.walk(json)
  end

  File.write(output_path, JSON.pretty_generate(json))
  output_path
end

# slack-api-ref misses many properties' type
# They need to be filled in
def normalize_type(name, attributes)
  return 'string' if attributes['type'] == 'enum'
  return 'string' if name == 'ts' || (attributes['type'] == 'timestamp' && attributes['example'].is_a?(String))
  return 'string' if name == 'image'

  # apps.manifest.create requires 'manifest' property as json but the slack-api-ref describes it wrong type
  return 'string' if attributes['format'] == 'json' || attributes['type'] == 'manifest object as string'
  # bots.info requires `bot` property but wrong type is set
  return 'string' if attributes['type'] == 'user'
  # chat.delete describes 'channel' prop wrong
  return 'string' if attributes['type'] == 'channel'
  # files.delete ...
  return 'string' if attributes['type'] == 'file'

  if attributes['type'].nil?
    case attributes['example']
    when String
      return 'string'
    when Numeric
      return 'number'
    else
      return 'string'
    end
  end

  attributes['type']
end

def generate_openapi_path(path)
  method_name = File.basename(path, '.json')
  return puts "Skip this method isn't supported #{method_name}" if UNSUPPORTED_METHODS.any? { _1.match(method_name) }

  json = JSON.parse(File.read(path))
  operation_id = method_name.camelize(separator: '\.')
  required = []
  request_body_props = json['args'].each_with_object({}) do |(name, attributes), props|
    camelized_name = name.camelize
    required.append(camelized_name) if attributes['required']

    if name == 'view'
      props['view'] = { '$ref': '#/components/schemas/View' }
    else
      normalized_type = normalize_type(name, attributes)
      props[camelized_name] = {
        type: normalized_type,
        example: attributes['example'],
        description: attributes['desc'],
      }
      props[camelized_name][:format] = 'binary' if name == 'image' && attributes['type'] == 'string'
    end
  end

  response_model_name = "#{method_name.split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"
  content_type = request_body_props.any? { |k,v| v[:type] == 'binary' } ? 'multipart/form-data' : 'application/json'
  content_schema = if request_body_props.empty?
                     { type: 'object', additionalProperties: false }
                   else
                     { type: 'object', properties: request_body_props, required: required }
                   end

  # Only 'apps.connections.open' wants to use token param in request body
  # to avoid normal OAuth token on Authorization header.
  if method_name == 'apps.connections.open'
    content_schema = {
        type: 'object',
        properties: {
          token: {
            type: 'string',
            description: 'App level token'
          }
        }
      }
  end

  request_body = {
    required: !request_body_props.empty?,
    content: {
      "#{content_type}": {
        schema: content_schema
      }
    }
  }

  base = {
    "#{method_name}": {
      # Slack seems accapt POST always
      post: {
        tags: [method_name.split('.').first.capitalize],
        operationId: operation_id,
        summary: json['desc'],
        requestBody: request_body,
        responses: {
          '200': {
            description: 'OK',
            content: {
              'application/json': {
                schema: {
                  '$ref': "#/components/schemas/#{response_model_name}"
                }
              }
            }
          }
        }
      }
    }
  }

  base
end

def adjust_schemas(openapi)
  openapi['components']['schemas'].each do |key, value|
    case key
    when 'View', 'Block'
      # View and Block should be implemented by SlackBlockKit.
      # To remove relevant schemas used within View and Block but proceed with swift-openapi-generator,
      # empty View and Block and eventually remove generated code in different script.
      openapi['components']['schemas'][key] = {
        type: 'object',
        properties: {},
        additionalProperties: true
      }
    else
      value['properties']&.each_key do |prop_name|
        # Match property name and corresponding type.
        # quicktype produces wrong types due to inconsistency in sample json in java-slack-sdk.
        case prop_name
        when /.*block$/i
          openapi['components']['schemas'][key]['properties'][prop_name]['$ref'] = '#/components/schemas/Block'
        when /.*blocks$/i
          openapi['components']['schemas'][key]['properties'][prop_name]['items']['$ref'] = '#/components/schemas/Block'
        when /^message$/
          openapi['components']['schemas'][key]['properties'][prop_name]['$ref'] = '#/components/schemas/Message'
        when /^messages$/
          # when messages array's element is object and not string type
          if openapi['components']['schemas'][key]['properties'][prop_name].dig('items', '$ref')
            openapi['components']['schemas'][key]['properties'][prop_name]['items']['$ref'] = '#/components/schemas/Message'
          end
        end
      end
    end
  end
end

def remove_orphan_schemas(openapi)
  loop do
    defined = openapi['components']['schemas'].keys
    referenced = openapi.to_json.scan(%r{"#/components/schemas/([^"]+)"}).flatten.uniq
    orphans = defined - referenced
    break if orphans.empty?

    orphans.each do |orphan|
      openapi['components']['schemas'].delete(orphan)
    end
  end
end

main(api_ref_paths, sample_json_paths, output_dir)
