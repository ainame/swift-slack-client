#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require_relative './lib/helpers'
require_relative './lib/visitors'

tmp_dir = './tmp'
source_dir = "#{tmp_dir}/java-slack-sdk/json-logs/samples/events"
events_dir = "#{tmp_dir}/Events/intermediates"
event_schemas_dir = "#{tmp_dir}/Events/schemas"

FileUtils.mkdir_p(events_dir)
FileUtils.mkdir_p(event_schemas_dir)

# Before generating JSON schema with quicktype. We need to normalize payload jsons.
# Some JSONs contain entire payload, others contain only event itself.
# Extract event if nested.
events = Dir.glob("#{source_dir}/*.json")
events.each do |path|
  model_name = File.basename(path, '.json').sub('Payload', 'Event')
  output_path = File.join(events_dir, "#{model_name}.json")
  json = JSON.parse(File.read(path))
  normalized_json = if json.key?('token') && json.key?('event')
                      puts "Normalized #{path}"
                      json['event']
                    else
                      json
                    end
  File.write(output_path, JSON.pretty_generate(normalized_json))
end

# Generate JSON schemas with quicktype
normalized_events = Dir.glob("#{events_dir}/*.json")
process_in_queue(normalized_events) do |path|
  model_name = File.basename(path, '.json')
  output_path = File.join(event_schemas_dir, "#{model_name}.json")
  if File.exist?(output_path)
    puts "Skip #{model_name} - #{output_path} exists already"
    next
  end

  command = 'npx quicktype --lang schema' \
            ' --all-properties-optional' \
            " --top-level #{model_name}" \
            " #{path}" \
            " > #{output_path}"
  puts "Generating schema: $ #{command}"
  system(command)
end

# Update JSON schemas
visitors = [
  ReferenceFixer.new,
  SnakeCaseToCamelCaseConverter.new,
  AcronymsFixer.new('DND' => 'Dnd')
]

event_schemas = Dir.glob("#{event_schemas_dir}/*.json")
event_schemas.each do |path|
  json = JSON.parse(File.read(path))
  visitors.each { _1.walk(json) }
  File.write(path, JSON.pretty_generate(json))
end

# Merge JSON schemas
openapi = JSON.parse(File.read('./scripts/lib/base_openapi.json'))
event_schemas.each do |path|
  json = JSON.parse(File.read(path))
  openapi['components']['schemas'].merge!(json['definitions'])
end

# Adjust schemas
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

loop do
  defined = openapi['components']['schemas'].keys.grep_v(/.+Event$/)
  referenced = openapi.to_json.scan(%r{"#/components/schemas/([^"]+)"}).flatten.uniq
  orphans = defined - referenced
  break if orphans.empty?

  orphans.each do |orphan|
    openapi['components']['schemas'].delete(orphan)
  end
end

File.write(File.join(tmp_dir, 'Events', 'openapi.json'), JSON.pretty_generate(openapi))
