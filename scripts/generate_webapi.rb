#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'yaml'
require_relative './lib/visitors'
require_relative './lib/helpers'

# https://github.com/slack-edge/slack-web-api-client/blob/4d1d93df8abe423ea7ee3b18591cd83d9bcfe6e6/scripts/code_generator.rb#L91-L115
# RTM API is legacy so not going to support it
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
  /im\./,
  /rtm\./
]

api_ref_dir = './.dependencies/slack-api-ref/methods/'
api_ref_paths = Dir.glob("#{api_ref_dir}/**/*.json")

json_logs = './.dependencies/java-slack-sdk/json-logs'
api_dir = "#{json_logs}/samples/api/"
sample_json_paths = Dir.glob("#{api_dir}*.json")

output_dir = './.tmp/WebAPI'
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
              ' --alphabetize-properties' \
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
    InvalidKeysRemover.new,
    ReferenceFixer.new,
    AcronymsFixer.new('DND' => 'Dnd'),
    TypeFixer.new,
    OptionalityFixer.new,
    ItemTsOptionalAdder.new,
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
  return 'object' if attributes['format'] == 'json'
  return 'string' if attributes['type'] == 'timestamp' && attributes['example'].is_a?(String)

  # apps.manifest.create requires 'manifest' property as json but the slack-api-ref describes it wrong type
  return 'string' if attributes['type'] == 'manifest object as string'
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
    required.append(name) if attributes['required']

    case name
    when 'view'
      props['view'] = { '$ref': '#/components/schemas/View' }
    when 'block'
      props['block'] = { '$ref': '#/components/schemas/Block' }
    when 'blocks'
      props['blocks'] = { 'type': 'array', 'items': { '$ref': '#/components/schemas/Block' } }
    when 'attachments'
      props['attachments'] = { 'type': 'array', 'items': { '$ref': '#/components/schemas/Attachment' } }
    when 'ts'
      props['ts'] = { 'type': 'string' }
    when 'image'
      props['image'] = { 'type': 'string', 'format': 'binary' }
    else
      normalized_type = normalize_type(name, attributes)
      props[name] = { 'type': normalized_type }
    end

    props[name]['example'] = attributes['example']
    props[name]['description'] = attributes['desc']
  end

  response_model_name = "#{method_name.split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"
  content_type = request_body_props.any? { |_, v| v['format'] == 'binary' } ? 'multipart/form-data' : 'application/json'
  content_schema = if request_body_props.empty?
                     { 'type': 'object', 'additionalProperties': false }
                   else
                     { 'type': 'object', 'properties': request_body_props, 'required': required }
                   end
  request_body = {
    'required': !request_body_props.empty?,
    'content': {
      "#{content_type}": {
        'schema': content_schema
      }
    }
  }

  base = {
    "#{method_name}": {
      # Slack seems accapt POST always
      'post': {
        'tags': [method_name.split('.').first.capitalize],
        'operationId': operation_id,
        'summary': json['desc'],
        'requestBody': request_body,
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {
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
