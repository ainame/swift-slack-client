#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

class ClientSplitter
  API_GROUPS = %w[
    admin apps assistant auth bookmarks bots canvases chat conversations
    dnd emoji files functions migration oauth openid pins reactions
    reminders rtm search stars team tooling users views
  ].freeze

  def self.run(directory = nil)
    new(directory).run
  end

  def initialize(directory = nil)
    @directory = directory || File.join(__dir__, '..', 'Sources', 'SlackClient', 'WebAPI', 'Generated')
    @client_file = File.join(@directory, 'Client.swift')
    @package_file = File.join(File.dirname(@directory), '..', '..', '..', 'Package.swift')
  end

  def run
    unless File.exist?(@client_file)
      puts "Error: Client.swift not found at #{@client_file}"
      exit 1
    end

    puts "Splitting Client.swift by API groups..."
    puts "Input file: #{@client_file}"
    puts "Output directory: #{@directory}"

    lines = File.readlines(@client_file)
    header_lines = extract_header(lines)
    base_content, functions = split_content(lines)

    write_base_file(base_content)
    write_group_files(functions, header_lines)
    update_package_swift(functions.keys)

    puts "\nSplit complete!"
    puts "Generated files:"
    puts "  - Client+Base.swift (#{base_content.size} lines)"
    functions.each { |group, content| puts "  - Client+#{capitalize_group_name(group)}.swift (#{content.size} lines)" }
  end

  private

  def extract_header(lines)
    # Extract header lines up to the struct declaration
    header_end = lines.find_index { |line| line.strip.start_with?('internal struct Client') }
    return [] unless header_end
    
    lines[0...header_end]
  end

  def split_content(lines)
    first_function_idx = lines.find_index { |line| function_line?(line) }
    return [lines, {}] unless first_function_idx

    # Find the start of the documentation comment for the first function
    comment_start_idx = first_function_idx
    (first_function_idx - 1).downto(0) do |i|
      line = lines[i].strip
      if line.start_with?('///') || line.start_with?('/// ') || line == '///'
        comment_start_idx = i
      else
        break unless line.empty?
      end
    end

    base_content = lines[0...comment_start_idx]
    function_lines = lines[comment_start_idx..-1]

    [base_content, parse_functions(function_lines)]
  end

  def parse_functions(lines)
    functions = Hash.new { |h, k| h[k] = [] }
    current_function = nil
    brace_count = 0
    pending_comments = []

    lines.each_with_index do |line, index|
      if (match = function_line?(line))
        current_function = extract_group_name(match[1])
        brace_count = 0
        
        # Include any pending comments with this function
        functions[current_function].concat(pending_comments)
        pending_comments.clear
      end

      if current_function
        functions[current_function] << line
        brace_count += line.count('{') - line.count('}')

        if brace_count.zero? && functions[current_function].size > 1
          current_function = nil
        end
      else
        # Collect comments that might belong to the next function
        stripped = line.strip
        if stripped.start_with?('///') || stripped.start_with?('/// ') || stripped == '///' || stripped.empty?
          pending_comments << line
        else
          pending_comments.clear
        end
      end
    end

    functions
  end

  def function_line?(line)
    line.strip.match(/^internal func (\w+)/)
  end

  def extract_group_name(function_name)
    API_GROUPS.find { |group| function_name&.start_with?(group) } || 'unknown'
  end

  def capitalize_group_name(group)
    case group
    when 'dnd' then 'DND'
    when 'oauth' then 'OAuth'
    when 'openid' then 'OpenID'
    when 'rtm' then 'RTM'
    else group.capitalize
    end
  end

  def write_base_file(content)
    # Change private access to internal for extension compatibility
    updated_content = content.map do |line|
      line.gsub(/^\s*private (let|var)\s/, '    internal \1 ')
    end
    File.write(File.join(@directory, 'Client+Base.swift'), [*updated_content, "}\n"].join)
    puts "Created Client+Base.swift"
  end

  def write_group_files(functions, header_lines)
    functions.each do |group, content|
      filename = "Client+#{capitalize_group_name(group)}.swift"
      File.write(File.join(@directory, filename), generate_extension_content(group, content, header_lines))
      puts "Created #{filename}"
    end
  end

  def generate_extension_content(group, functions, header_lines)
    trait = "WebAPI_#{capitalize_group_name(group)}"
    header = header_lines.join

    <<~SWIFT
      #if #{trait}
      #{header}
      extension Client {
      #{functions.join}
      }
      #endif
    SWIFT
  end

  def update_package_swift(groups)
    return unless File.exist?(@package_file)

    content = File.read(@package_file)
    
    # Generate WebAPI trait names
    webapi_trait_names = groups.map { |group| "WebAPI_#{capitalize_group_name(group)}" }
    
    # Generate the traits list variable definition
    traits_list_definition = <<~SWIFT
      // BEGIN: Generated WebAPI traits - Do not edit manually
      let webAPITraits: [String] = [
          #{webapi_trait_names.map { |name| "\"#{name}\"" }.join(",\n    ")}
      ]

      var traits: [Trait] = webAPITraits.map { .trait(name: $0) }
      // END: Generated WebAPI traits

    SWIFT
    
    # Check if markers already exist
    if content.include?('// BEGIN: Generated WebAPI traits')
      # Replace only the content between markers
      updated_content = content.gsub(/\/\/ BEGIN: Generated WebAPI traits.*?\/\/ END: Generated WebAPI traits/m, traits_list_definition.strip)
    else
      # Insert new section before Package definition
      updated_content = content.sub(/(let package = Package\()/) do
        "#{traits_list_definition}#{$1}"
      end
    end
    
    # Find and update the traits section to use Set(traits)
    updated_content = updated_content.gsub(/(\s+traits:\s*\[\s*\n)(.*?)(\n\s*\],)/m) do |match|
      indent = $1.gsub(/\[\s*\n$/, '')
      closing = $3
      "#{indent}Set(traits),#{closing}"
    end
    
    File.write(@package_file, updated_content)
    puts "Updated Package.swift with #{groups.size} WebAPI traits (all enabled by default)"
  end
end

if __FILE__ == $0
  if ARGV.empty?
    ClientSplitter.run
  else
    directory = ARGV[0]
    unless Dir.exist?(directory)
      puts "Error: Directory '#{directory}' does not exist"
      exit 1
    end
    ClientSplitter.run(directory)
  end
end