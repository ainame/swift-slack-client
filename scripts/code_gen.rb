#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'yaml'

json_logs = '../../slackapi/java-slack-sdk/json-logs'
api_dir = "#{json_logs}/samples/api/"
output_dir = './Sources/SlackClient'

FileUtils.mkdir_p(File.join(output_dir, 'schemas'))
paths = Dir.glob("#{api_dir}*.json")
CONCURRENCY = 24

def main(paths, output_dir)
  process_in_queue(paths) do |path|
    generate_schema(path, File.join(output_dir, 'schemas'))
  end

  schema_paths = Dir.glob("#{output_dir}/schemas/*.json")
  File.write(File.join(output_dir, 'openapi.yaml'), openapi_yaml(schema_paths))
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

def generate_schema(path, output_dir)
  model_name = "#{File.basename(path, '.json').split('.').map { _1.sub(/\A./, &:upcase) }.join}Response"
  output_path = File.join(output_dir, "#{model_name}.json")
  return puts "Found #{path} exists. Skip generating schema." if File.exist?(output_path)

  command = "npx quicktype --lang schema #{path} --all-properties-optional --top-level #{model_name} > #{output_path}"
  puts "Generating schema: $ #{command}"
  system(command)

  # fix json
  json = JSON.parse(File.read(output_path))
  visitors = [
    ReferenceFixer.new,
    SnakeCaseToCamelCaseConverter.new
  ]
  visitors.each do |visitor|
    visitor.walk(json)
  end

  File.write(output_path, JSON.pretty_generate(json))
  output_path
end

def openapi_yaml(paths)
  base = {
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

  paths.each do |path|
    json = JSON.parse(File.read(path))
    base[:components][:schemas].merge!(json['definitions'])
  end

  # JSON format in yaml is completely valid yaml format
  JSON.pretty_generate(base)
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


main(paths, output_dir)
