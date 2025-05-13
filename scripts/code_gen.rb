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

  schema_paths = Dir.glob("#{output_dir}/schemas/*.json").grep(/ChatPostMessage/)
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

  command = "npx quicktype --lang schema #{path} --top-level #{model_name} > #{output_path}"
  puts "Generating schema: $ #{command}"
  system(command)

  # fix json
  json = JSON.parse(File.read(output_path))
  visitor = CoercingEmptyItemsTypeVisitor.new
  visitor.walk(json)
  visitor = DereferenceVisitor.new(model_name)
  visitor.walk(json)
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

# quicktype can't infer nested type if example is empty
# empty array will be coerced to list of string
class CoercingEmptyItemsTypeVisitor
  def walk(root)
    visit(root)
  end

  private

  def visit(data)
    case data
    when Array
      data.each { visit(_1) }
    when Hash
      if data['type'] == 'array' && data['items'].empty?
        data['items'] = { 'type' => 'string' }
      else
        data.each_value { visit(_1) }
      end
    else
      data
    end
  end
end

# $ref isn't supported in swift-openapi-generator so this will de-reference $ref part
class DereferenceVisitor
  attr_accessor :root_type, :definitions

  def initialize(root_type)
    @root_type = root_type
  end

  def walk(root)
    # keep the original definitions
    self.definitions = root['definitions'].dup
    # Dereference data
    visit(root['definitions'])
    # Clean up unwanted objects before returning
    root['definitions'].delete_if { _1 != root_type }
    root
  end

  private

  def visit(data)
    case data
    when Array
      data.each { visit(_1) }
    when Hash
      if data.keys == ["$ref"]
        ref_type = data["$ref"].sub('#/definitions/', '')
        data.merge!(definitions[ref_type])
        data.delete('$ref')
      else
        data.each_value { visit(_1) }
      end
    else
      data
    end
  end
end

main(paths, output_dir)
