#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'yaml'

CONCURRENCY = 24

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

api_ref_dir = '../../slack-ruby/slack-api-ref/methods/'
api_ref_paths = Dir.glob("#{api_ref_dir}/**/*.json")

json_logs = '../../slackapi/java-slack-sdk/json-logs'
api_dir = "#{json_logs}/samples/api/"
sample_json_paths = Dir.glob("#{api_dir}*.json")

output_dir = './Sources/SlackClient'
FileUtils.mkdir_p(File.join(output_dir, 'schemas'))

def main(api_ref_paths, sample_json_paths, output_dir)
  openapi_yaml = base_openapi_yaml

  # Generate schemas by quicktype
  process_in_queue(sample_json_paths) do |path|
    generate_openapi_component(path, File.join(output_dir, 'schemas'))
  end

  # Load generated schemas and put them in #components/schemas section
  schema_paths = Dir.glob("#{output_dir}/schemas/*.json")
  schema_paths.each do |path|
    json = JSON.parse(File.read(path))
    openapi_yaml[:components][:schemas].merge!(json['definitions'])
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
  openapi_yaml[:paths] = paths

  # Output openapi_yaml
  File.write(File.join(output_dir, 'openapi.json'), JSON.pretty_generate(openapi_yaml))
end

def process_in_queue(items, &block)
  queue = Queue.new
  items.each { queue.push(_1) }
  queue.close

  threads = CONCURRENCY.times.map do
    Thread.new do
      while item = queue.pop
        block.call(item)
      end
    end
  end

  threads.each(&:join)
end

def generate_openapi_component(path, output_dir)
  method_name = File.basename(path, '.json')
  return puts "Skip, this method isn't supported #{method_name}" if UNSUPPORTED_METHODS.include?(method_name)

  model_name = "#{method_name.split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"
  output_path = File.join(output_dir, "#{method_name}.json")

  if File.exist?(output_path)
    puts "Found #{path} exists. Skip generating schema."
  else
    command = "npx quicktype --lang schema #{path} --all-properties-optional --top-level #{model_name} > #{output_path}"
    puts "Generating schema: $ #{command}"
    system(command)
  end

  # fix json
  json = JSON.parse(File.read(output_path))
  visitors = [
    ReferenceFixer.new,
    SnakeCaseToCamelCaseConverter.new,
    OptionalityFixer.new,
  ]
  visitors.each do |visitor|
    visitor.walk(json)
  end

  File.write(output_path, JSON.pretty_generate(json))
  output_path
end

def generate_openapi_path(path)
  method_name = File.basename(path, '.json')
  return puts "Skip this method isn't supported #{method_name}" if UNSUPPORTED_METHODS.any? { _1.match(method_name) }

  json = JSON.parse(File.read(path))
  operation_id = method_name.gsub(/\.([a-z])/) { Regexp.last_match(1).upcase }
  required = []
  request_body_props = json['args'].each_with_object({}) do |(name, value), props|
    props[name] = {
      schema: {
        type: value['type'],
        example: value['example']
      }
    }
    required.append(name) if value['required']
  end

  response_model_name = "#{method_name.split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"

  {
    "/#{method_name}": {
      # Slack seems accapt POST always
      post: {
        operationId: operation_id,
        summary: json['desc'],
        requestBody: {
          required: true,
          content: {
            'application/json': {
              schema: {
                type: 'object',
                properties: request_body_props,
                required: required
              }
            }
          }
        },
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
end

def base_openapi_yaml
  {
    openapi: '3.1.0',
    info: {
      title: 'Slack API Schema',
      version: '1.0.0'
    },
    paths: {},
    components: {
      schemas: {}
    }
  }
end

# in openapi.yaml, we don't have definitions section and instead it's components
class ReferenceFixer
  def walk(root)
    visit(root)
  end

  private

  def visit(data)
    case data
    when Array
      data.each { visit(_1) }
    when Hash
      if data.keys == ['$ref']
        data['$ref'].sub!('#/definitions/', '#/components/schemas/')
      else
        data.each_value { visit(_1) }
      end
    else
      data
    end
  end
end

# In common Slack response, `ok` always exists
class OptionalityFixer
  def walk(root)
    visit(root)
  end

  private

  def visit(data)
    case data
    when Array
      data.each { visit(_1) }
    when Hash
      if data.keys.include?('properties') && data.keys.include?('required') && data['properties'].keys.include?('ok') && !data['required'].include?('ok')
        data['required'].append('ok')
        data['required'].uniq!
      end
      data.each_value { visit(_1) }
    else
      data
    end
  end
end

# Quicktype doesn't convert key's case
class SnakeCaseToCamelCaseConverter
  def walk(root)
    visit(root['definitions'])
  end

  private

  def visit(data)
    case data
    when Array
      data.each { visit(_1) }
    when Hash
      data.keys.each do |key|
        value = data[key]
        visit(value)
        next unless key.match?(/_/)

        camel_case_key = key.gsub(/_([a-z])/) { Regexp.last_match(1).upcase }
        data[camel_case_key] = value
        data.delete(key)
      end
    else
      data
    end
  end
end

main(api_ref_paths, sample_json_paths, output_dir)
