#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/content_transformer'
require_relative 'lib/output'

# Handles transformation of generated Events code to extract Event structs
# and transform them into individual SlackEvent conforming types
class EventsProcessor
  def self.run(input_file = nil, output_directory = nil)
    new(input_file, output_directory).run
  end

  def initialize(input_file = nil, output_directory = nil)
    @input_file = input_file || File.join(__dir__, '..', '.tmp', 'Events', 'Types.swift')
    @output_directory = output_directory || File.join(__dir__, '..', 'Sources', 'SlackClient', 'Events', 'Generated')
  end

  # Main processing method that extracts and transforms Event structs
  def run
    unless File.exist?(@input_file)
      Output.info "Error: Events Types.swift not found at #{@input_file}"
      exit 1
    end

    Output.step "Processing Events Types.swift"
    Output.info "Input file: #{@input_file}"
    Output.info "Output directory: #{@output_directory}"

    # Create output directory
    FileUtils.mkdir_p(@output_directory)

    # Parse and extract Event structs
    content = File.read(@input_file)
    event_structs = extract_event_structs(content)

    # Generate individual event files
    event_structs.each do |event_name, event_content|
      generate_event_file(event_name, event_content)
    end

    # Generate polymorphic EventType enum
    generate_event_type_enum(event_structs.keys)

    Output.summary "Processing complete! Generated #{event_structs.size} event files + EventType.swift:",
                   event_structs.keys.map { |name| "#{name}.swift" } + ["EventType.swift"]
  end

  private

  # Dynamically determines which types have been moved to SlackModels
  def get_slackmodels_types
    @slackmodels_types ||= begin
      types = []

      # Check both SlackModels root directory and Generated subdirectory
      slackmodels_root = File.join(__dir__, '..', 'Sources', 'SlackModels')
      slackmodels_generated = File.join(slackmodels_root, 'Generated')

      # Get manually created models from SlackModels root
      if Dir.exist?(slackmodels_root)
        Dir.glob(File.join(slackmodels_root, '*.swift')).each do |file|
          types << File.basename(file, '.swift')
        end
      end

      # Get generated models from SlackModels/Generated
      if Dir.exist?(slackmodels_generated)
        Dir.glob(File.join(slackmodels_generated, '*.swift')).each do |file|
          types << File.basename(file, '.swift')
        end
      end

      types.sort.uniq
    end
  end

  # Extracts all Event structs from the Components.Schemas enum
  def extract_event_structs(content)
    lines = content.lines
    event_structs = {}

    # Find the start of Components.Schemas
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }
    return {} unless schemas_start

    i = schemas_start + 1
    while i < lines.length
      line = lines[i]
      stripped = line.strip

      # Look for Event struct comment (not property-level comments)
      if match = stripped.match(/\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+Event)`\.$/)
        event_name = $1
        event_lines = []

        # Collect all lines until we hit the next struct or enum
        j = i
        while j < lines.length
          current_line = lines[j]
          current_stripped = current_line.strip

          # Stop if we hit another struct/enum declaration (not property comments)
          if j > i && current_stripped.match(/^\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+)`\.$/)
            break
          end

          event_lines << current_line
          j += 1
        end


        if !event_lines.empty?
          event_structs[event_name] = event_lines.join
        end

        i = j  # Continue from where we left off
      else
        i += 1
      end
    end

    event_structs
  end

  # Generates an individual event file with proper transformations
  def generate_event_file(event_name, event_content)
    # Transform the event content
    transformed_content = transform_event_content(event_content, event_name)


    # Check if we need imports
    needs_slackblockkit_import = transformed_content.include?('BlockType') ||
                                transformed_content.include?('ViewType')
    needs_slackmodels_import = transformed_content.include?('SlackModels.')

    # Generate the complete file content
    file_content = generate_file_content(event_name, transformed_content, needs_slackblockkit_import, needs_slackmodels_import)

    # Write the file
    filename = "#{event_name}.swift"
    filepath = File.join(@output_directory, filename)
    File.write(filepath, file_content)
    Output.created filename
  end

  # Generates the polymorphic EventType enum for handling all event types
  def generate_event_type_enum(event_names)
    # Sort event names for consistent output
    sorted_events = event_names.sort

    # Generate enum cases
    enum_cases = sorted_events.map do |event_name|
      case_name = camel_case_to_lower_camel_case(event_name.gsub(/Event$/, ''))
      "    case #{case_name}(#{event_name})"
    end

    # Generate switch cases for decoding
    switch_cases = sorted_events.map do |event_name|
      case_name = camel_case_to_lower_camel_case(event_name.gsub(/Event$/, ''))
      type_value = generate_slack_event_type(event_name)
      "        case \"#{type_value}\":\n            self = .#{case_name}(try #{event_name}(from: decoder))"
    end

    # Generate switch cases for payload computed property
    payload_cases = sorted_events.map do |event_name|
      case_name = camel_case_to_lower_camel_case(event_name.gsub(/Event$/, ''))
      "        case .#{case_name}(let event):\n            return event"
    end

    file_content = <<~SWIFT
#if Events
import Foundation

/// Polymorphic event type that can decode any Slack event based on the type field
public enum EventType: Decodable, Hashable, Sendable {
#{enum_cases.join("\n")}
    case unsupported(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
#{switch_cases.join("\n")}
        default:
            self = .unsupported(type)
        }
    }

    /// Returns the contained event as a SlackEvent
    public var payload: (any SlackEvent)? {
        switch self {
#{payload_cases.join("\n")}
        case .unsupported:
            return nil
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
#endif
    SWIFT

    # Write the EventType.swift file
    filename = "EventType.swift"
    filepath = File.join(@output_directory, filename)
    File.write(filepath, file_content)
    Output.created filename
  end

  # Converts CamelCase to lowerCamelCase for enum case names
  def camel_case_to_lower_camel_case(str)
    # Handle special cases
    str = str.gsub(/ID/, 'Id')  # ChannelIDChanged -> ChannelIdChanged
    str = str.gsub(/IM/, 'Im')  # IMClose -> ImClose
    
    # Convert to snake_case first
    snake_case = str.gsub(/([A-Z])/) { "_#{$1.downcase}" }.sub(/^_/, '').downcase
    
    # Convert snake_case to lowerCamelCase
    parts = snake_case.split('_')
    parts.first + parts[1..-1].map(&:capitalize).join
  end

  # Generates the Slack event type string from the event class name
  def generate_slack_event_type(event_name)
    # Remove 'Event' suffix and convert to snake_case
    base_name = event_name.gsub(/Event$/, '')
    
    # Handle special cases for Slack's naming conventions
    base_name = base_name.gsub(/ID/, 'Id')  # ChannelIDChanged -> ChannelIdChanged
    base_name = base_name.gsub(/IM/, 'Im')  # IMClose -> ImClose
    
    # Convert to snake_case for Slack event type format
    base_name.gsub(/([A-Z])/) { "_#{$1.downcase}" }.sub(/^_/, '').downcase
  end

  # Transforms event struct content according to requirements
  def transform_event_content(content, event_name)
    lines = content.lines
    transformed_lines = []
    skip_until_end = false
    brace_depth = 0
    in_struct = false

    lines.each do |line|
      stripped = line.strip

      # Detect start of struct
      if line.match(/(\s*)public struct #{Regexp.escape(event_name)}:/)
        in_struct = true
        # Change struct declaration to conform to SlackEvent
        line = line.gsub(/:.*$/, ': SlackEvent {')
        transformed_lines << line
        next
      end

      # Only process lines inside the struct
      next unless in_struct

      # Skip CodingKeys enum completely
      if stripped.match(/^public enum CodingKeys:/)
        skip_until_end = true
        brace_depth = 1  # CodingKeys enum starts with opening brace
        next
      end

      # Skip custom init and decode methods
      if stripped.start_with?('public init(') ||
         stripped.start_with?('/// Creates a new') ||
         stripped.start_with?('public init(from decoder:') ||
         stripped.start_with?('public func encode(')
        skip_until_end = true
        brace_depth = line.count('{') - line.count('}')
        next
      end

      if skip_until_end
        brace_depth += line.count('{') - line.count('}')
        if brace_depth <= 0
          skip_until_end = false
        end
        next
      end

      # Skip parameter documentation comments for init
      next if stripped.match(/^\/\/\/ - Parameters:/) ||
              stripped.match(/^\/\/\/ +- \w+:/)

      # Apply content transformations
      line = ContentTransformer.transform_type_properties(line)
      line = ContentTransformer.transform_blockkit_references(line)

      # Replace Components.Schemas.XXX with SlackModels.XXX only for types moved to SlackModels
      if line.match(/\bComponents\.Schemas\.(?!View\b|Block\b)\w+\b/)
        line = line.gsub(/\bComponents\.Schemas\.(\w+)\b/) do |match|
          type_name = $1
          # Dynamically determine which types are in SlackModels
          slackmodels_types = get_slackmodels_types

          if slackmodels_types.include?(type_name)
            "SlackModels.#{type_name}"
          else
            match  # Keep original if not moved to SlackModels
          end
        end
      end

      # Handle closing brace
      if stripped == '}' && !skip_until_end
        transformed_lines << "}\n"
        break
      end

      # Keep property declarations, remark comments, and empty lines
      if stripped.start_with?('/// - Remark:') || stripped.start_with?('public var') || stripped.empty?
        # Fix indentation: convert from nested (12 spaces) to top-level (4 spaces)
        if line.start_with?('            ')  # 12 spaces from deeply nested structure
          line = '    ' + line[12..-1]      # Replace with 4 spaces for top-level struct
        end
        transformed_lines << line
      end
    end

    transformed_lines.join
  end

  # Generates the complete file content with proper imports and compilation directives
  def generate_file_content(event_name, transformed_content, needs_slackblockkit_import, needs_slackmodels_import)
    imports = ["import Foundation"]

    if needs_slackmodels_import
      imports << "import SlackModels"
    end

    if needs_slackblockkit_import
      imports << "#if canImport(SlackBlockKit)"
      imports << "import SlackBlockKit"
      imports << "#endif"
    end

    <<~SWIFT
      #if Events
      #{imports.join("\n")}

      #{transformed_content.strip}
      #endif
    SWIFT
  end
end

if __FILE__ == $0
  if ARGV.empty?
    EventsProcessor.run
  elsif ARGV.length == 1
    # Single argument can be input file or output directory
    arg = ARGV[0]
    if File.file?(arg)
      EventsProcessor.run(arg, nil)
    elsif Dir.exist?(arg) || arg.end_with?('/')
      EventsProcessor.run(nil, arg)
    else
      puts "Error: '#{arg}' is not a valid file or directory"
      exit 1
    end
  else
    # Two arguments: input file and output directory
    input_file = ARGV[0]
    output_directory = ARGV[1]

    unless File.exist?(input_file)
      puts "Error: Input file '#{input_file}' does not exist"
      exit 1
    end

    # Create output directory if it doesn't exist
    FileUtils.mkdir_p(output_directory)

    EventsProcessor.run(input_file, output_directory)
  end
end
