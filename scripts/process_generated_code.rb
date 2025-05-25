#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

# Handles transformation of generated Swift code to replace specific schema types
# with custom SlackBlockKit types and add conditional imports
class CodeTransformer
  # Transforms client function content by replacing schema references
  def self.transform_client_functions(content)
    content.gsub(/\bComponents\.Schemas\.View\b/, 'SlackBlockKit.ViewType')
           .gsub(/\bComponents\.Schemas\.Block\b/, 'SlackBlockKit.BlockType')
  end
  
  # Transforms operations content and adds conditional imports if needed
  def self.transform_operations_content(content)
    # Check if we need SlackBlockKit import
    needs_slackblockkit_import = content.match(/\bComponents\.Schemas\.View\b/) || 
                                content.match(/\bComponents\.Schemas\.Block\b/)
    
    # Apply transformations
    transformed_content = content.gsub(/\bComponents\.Schemas\.View\b/, 'SlackBlockKit.ViewType')
                                .gsub(/\bComponents\.Schemas\.Block\b/, 'SlackBlockKit.BlockType')
    
    # Add SlackBlockKit import if needed
    if needs_slackblockkit_import
      transformed_content = add_conditional_import(transformed_content, 'SlackBlockKit')
    end
    
    transformed_content
  end
  
  # Transforms components content by removing CodingKeys and fixing property names
  def self.transform_components_content(content)
    lines = content.lines
    transformed_lines = []
    skip_until_end = false
    brace_depth = 0
    needs_slackblockkit_import = false
    
    lines.each do |line|
      stripped = line.strip
      
      # Skip CodingKeys enum completely
      if stripped.match(/^public enum CodingKeys:/)
        skip_until_end = true
        brace_depth = 0
        next
      end
      
      if skip_until_end
        brace_depth += line.count('{') - line.count('}')
        if brace_depth < 0 && stripped == '}'
          skip_until_end = false
        end
        next
      end
      
      # Transform _type property to type
      if line.include?('_type')
        line = line.gsub(/\b_type\b/, 'type')
      end
      
      # Replace Components.Schemas.View with SlackBlockKit.ViewType (exact match only)
      if line.match(/\bComponents\.Schemas\.View\b/)
        line = line.gsub(/\bComponents\.Schemas\.View\b/, 'SlackBlockKit.ViewType')
        needs_slackblockkit_import = true
      end
      
      # Replace Components.Schemas.Block with SlackBlockKit.BlockType (exact match only)
      if line.match(/\bComponents\.Schemas\.Block\b/)
        line = line.gsub(/\bComponents\.Schemas\.Block\b/, 'SlackBlockKit.BlockType')
        needs_slackblockkit_import = true
      end
      
      transformed_lines << line
    end
    
    # Add SlackBlockKit import if needed
    if needs_slackblockkit_import
      transformed_lines = add_conditional_import_to_lines(transformed_lines, 'SlackBlockKit')
    end
    
    transformed_lines.join
  end
  
  private
  
  # Adds conditional import to content string
  def self.add_conditional_import(content, module_name)
    lines = content.lines
    add_conditional_import_to_lines(lines, module_name).join
  end
  
  # Adds conditional import to array of lines
  def self.add_conditional_import_to_lines(lines, module_name)
    # Find the end of the conditional import block (#endif)
    endif_index = lines.find_index { |line| line.strip == '#endif' }
    if endif_index
      # Insert after #endif
      lines.insert(endif_index + 1, "\n#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
    else
      # No conditional block found, add at the end of imports
      last_import_index = lines.rindex { |line| line.strip.start_with?('import ') }
      if last_import_index
        lines.insert(last_import_index + 1, "\n#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
      else
        lines.unshift("#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
      end
    end
    lines
  end
end

# Handles parsing and splitting of Swift client functions by API groups
class ClientFunctionParser
  API_GROUPS = %w[
    admin apps assistant auth bookmarks bots canvases chat conversations
    dnd emoji files functions migration oauth openid pins reactions
    reminders rtm search stars team tooling users views
  ].freeze
  
  # Extracts header lines from client file (everything before struct declaration)
  def self.extract_header(lines)
    header_end = lines.find_index { |line| line.strip.start_with?('internal struct Client') }
    return [] unless header_end
    lines[0...header_end]
  end
  
  # Splits client content into base content and grouped functions
  def self.split_content(lines)
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
  
  # Parses function lines and groups them by API group
  def self.parse_functions(lines)
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
  
  # Extracts API group name from function name
  def self.extract_group_name(function_name)
    API_GROUPS.find { |group| function_name&.start_with?(group) } || 'unknown'
  end
  
  private
  
  # Checks if a line contains a function declaration
  def self.function_line?(line)
    line.strip.match(/^internal func (\w+)/)
  end
end

# Handles naming conventions and capitalization for API groups
class GroupNameFormatter
  # Capitalizes group names with special cases for acronyms
  def self.capitalize_group_name(group)
    case group
    when 'dnd' then 'DND'
    when 'oauth' then 'OAuth'
    when 'openid' then 'OpenID'
    when 'rtm' then 'RTM'
    else group.capitalize
    end
  end
end

# Handles Swift Package Manager configuration updates
class PackageConfigurationManager
  # Updates Package.swift with generated WebAPI traits
  def self.update_package_swift(package_file, groups)
    return unless File.exist?(package_file)

    content = File.read(package_file)

    # Generate WebAPI trait names
    webapi_trait_names = groups.map { |group| "WebAPI_#{GroupNameFormatter.capitalize_group_name(group)}" }

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

    File.write(package_file, updated_content)
    puts "Updated Package.swift with #{groups.size} WebAPI traits (all enabled by default)"
  end
end

# Main orchestrator class that coordinates the code generation process
class CodeGenerationProcessor
  def self.run(input_directory = nil, output_directory = nil)
    new(input_directory, output_directory).run
  end

  def initialize(input_directory = nil, output_directory = nil)
    @input_directory = input_directory || File.join(__dir__, '..', 'tmp')
    @output_directory = output_directory || File.join(__dir__, '..', 'Sources', 'SlackClient', 'WebAPI', 'Generated')
    @client_file = File.join(@input_directory, 'Client.swift')
    @types_file = File.join(@input_directory, 'Types.swift')
    @package_file = File.join(File.dirname(@output_directory), '..', '..', '..', 'Package.swift')
  end

  # Main processing method that orchestrates the entire code generation pipeline
  def run
    unless File.exist?(@client_file)
      puts "Error: Client.swift not found at #{@client_file}"
      exit 1
    end

    puts "Processing generated Swift code..."
    puts "Input directory: #{@input_directory}"
    puts "Output directory: #{@output_directory}"

    # Parse and split client functions
    lines = File.readlines(@client_file)
    header_lines = ClientFunctionParser.extract_header(lines)
    base_content, functions = ClientFunctionParser.split_content(lines)

    # Generate output files
    write_base_file(base_content, header_lines)
    write_group_files(functions, header_lines)
    PackageConfigurationManager.update_package_swift(@package_file, functions.keys)
    
    # Process additional files
    TypesSplitter.new(@types_file, @output_directory).split_types_file
    BaseFileCreator.new(@input_directory, @output_directory).create_base_files
    ComponentsSplitter.new(@output_directory).split_components_file
    OperationsSplitter.new(@output_directory).split_operations_file

    puts "\nProcessing complete!"
    puts "Generated files:"
    puts "  - Client/Client+Base.swift (#{base_content.size} lines)"
    functions.each { |group, content| puts "  - Client/Client+#{GroupNameFormatter.capitalize_group_name(group)}.swift (#{content.size} lines)" }
    puts "  - Types.swift split into individual declaration files with conditional compilation"
    puts "  - Components split into Components/ subdirectory with group-specific files"
    puts "  - Operations split into Operations/ subdirectory with group-specific files"
  end

  private
  
  # Writes the base client file with transformed content and conditional imports
  def write_base_file(content, header_lines)
    # Change private access to internal for extension compatibility
    updated_content = content.map do |line|
      line.gsub(/^\s*private (let|var)\s/, '    internal \1 ')
    end
    
    # Transform schema references
    final_content = updated_content.map do |line|
      CodeTransformer.transform_client_functions(line)
    end
    
    # Check if we need SlackBlockKit import
    content_string = final_content.join
    needs_slackblockkit_import = content_string.include?('SlackBlockKit.ViewType') || 
                                content_string.include?('SlackBlockKit.BlockType')
    
    if needs_slackblockkit_import
      final_content = add_conditional_import_to_content(final_content, 'SlackBlockKit')
    end

    # Create Client subdirectory and write file
    client_dir = File.join(@output_directory, 'Client')
    FileUtils.mkdir_p(client_dir)
    File.write(File.join(client_dir, 'Client+Base.swift'), [*final_content, "}\n"].join)
    puts "Created Client/Client+Base.swift"
  end
  
  # Writes group-specific client extension files with trait-based conditional compilation
  def write_group_files(functions, header_lines)
    client_dir = File.join(@output_directory, 'Client')
    FileUtils.mkdir_p(client_dir)

    functions.each do |group, content|
      filename = "Client+#{GroupNameFormatter.capitalize_group_name(group)}.swift"
      File.write(File.join(client_dir, filename), generate_extension_content(group, content, header_lines))
      puts "Created Client/#{filename}"
    end
  end
  
  # Generates Swift extension content for a specific API group
  def generate_extension_content(group, functions, header_lines)
    trait = "WebAPI_#{GroupNameFormatter.capitalize_group_name(group)}"
    header = header_lines.join
    functions_content = functions.join
    
    # Check if we need SlackBlockKit import
    needs_slackblockkit_import = functions_content.match(/\bComponents\.Schemas\.View\b/) || 
                                functions_content.match(/\bComponents\.Schemas\.Block\b/)
    
    # Transform the functions content
    transformed_functions = CodeTransformer.transform_client_functions(functions_content)
    
    # Add SlackBlockKit import to header if needed
    final_header = if needs_slackblockkit_import
      header_lines_array = header_lines.dup
      final_header_lines = add_conditional_import_to_content(header_lines_array, 'SlackBlockKit')
      final_header_lines.join
    else
      header
    end

    <<~SWIFT
      #if #{trait}
      #{final_header}
      extension Client {
      #{transformed_functions}
      }
      #endif
    SWIFT
  end
  
  # Adds conditional import to content, handling different import block scenarios
  def add_conditional_import_to_content(content_lines, module_name)
    # Find the end of the conditional import block (#endif)
    endif_index = content_lines.find_index { |line| line.strip == '#endif' }
    if endif_index
      # Insert after #endif
      content_lines.insert(endif_index + 1, "\n#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
    else
      # No conditional block found, add at the end of imports
      last_import_index = content_lines.rindex { |line| line.strip.start_with?('import ') }
      if last_import_index
        content_lines.insert(last_import_index + 1, "\n#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
      else
        content_lines.unshift("#if canImport(#{module_name})\nimport #{module_name}\n#endif\n")
      end
    end
    content_lines
  end


  def split_types_file
    return unless File.exist?(@types_file)

    puts "Splitting Types.swift by top-level declarations..."
    content = File.read(@types_file)
    lines = content.lines

    # Find top-level declaration blocks
    blocks = parse_types_blocks(lines)

    # Write individual files
    blocks.each do |name, block_lines|
      filename = "#{name}.swift"
      filepath = File.join(@output_directory, filename)

      # Apply conditional compilation to APIProtocol
      if name == 'APIProtocol'
        content = apply_conditional_compilation_to_protocol(block_lines.join)
        File.write(filepath, content)
      else
        File.write(filepath, block_lines.join)
      end

      puts "Created #{filename} (#{block_lines.size} lines)"
    end
  end

  def parse_types_blocks(lines)
    blocks = {}
    header_lines = []
    top_level_blocks = ['APIProtocol', 'Servers', 'Components', 'Operations']

    # Collect header lines (imports, etc.) before first declaration - excluding any documentation
    first_declaration_idx = lines.find_index { |line| line.strip.match(/^public (protocol|enum)/) }
    return {} unless first_declaration_idx

    # Find the start of documentation for the first declaration
    first_doc_start = find_documentation_start(lines, first_declaration_idx)
    header_lines = lines[0...first_doc_start]

    # Find boundaries of each top-level block with their documentation
    block_info = {}
    lines.each_with_index do |line, index|
      stripped = line.strip
      if match = stripped.match(/^public (protocol|enum) (\w+)/)
        block_name = $2
        if top_level_blocks.include?(block_name)
          # Find the start of documentation for this block
          doc_start_idx = find_documentation_start(lines, index)
          block_info[block_name] = {
            doc_start: doc_start_idx,
            decl_start: index
          }
        end
      end
    end

    # Sort blocks by their declaration positions
    sorted_blocks = block_info.sort_by { |name, info| info[:decl_start] }

    # Extract content for each block
    sorted_blocks.each_with_index do |(block_name, info), i|
      start_idx = info[:doc_start]
      end_idx = if i < sorted_blocks.length - 1
        next_block_info = sorted_blocks[i + 1][1]
        find_documentation_start(lines, next_block_info[:decl_start]) - 1
      else
        lines.length - 1
      end

      block_lines = lines[start_idx..end_idx]
      blocks[block_name] = header_lines + block_lines
    end

    blocks
  end

  def find_documentation_start(lines, decl_index)
    # Look backwards from declaration to find the start of its documentation
    doc_start = decl_index
    (decl_index - 1).downto(0) do |i|
      line = lines[i].strip
      if line.start_with?('///') || line.start_with?('/// ') || line == '///'
        doc_start = i
      elsif line.empty?
        # Allow empty lines within documentation blocks
        next
      else
        # Hit non-documentation, non-empty line - stop
        break
      end
    end
    doc_start
  end

  def split_components_file
    components_file = File.join(@output_directory, 'Components.swift')
    return unless File.exist?(components_file)

    puts "Splitting Components.swift by schema groups..."
    content = File.read(components_file)

    # Parse component schemas using more sophisticated approach
    schema_groups = parse_components_by_schemas(content)

    # Create Components subdirectory
    components_dir = File.join(@output_directory, 'Components')
    FileUtils.mkdir_p(components_dir)

    # Write group files
    schema_groups.each do |group, content_lines|
      filename = if group == 'Common'
        'Components+Common.swift'
      else
        "Components+#{capitalize_group_name(group)}.swift"
      end
      filepath = File.join(components_dir, filename)

      File.write(filepath, content_lines)
      puts "Created Components/#{filename} (#{content_lines.lines.size} lines)"
    end

    # Remove original Components.swift
    File.delete(components_file)
    puts "Removed original Components.swift"
  end

  def split_operations_file
    operations_file = File.join(@output_directory, 'Operations.swift')
    return unless File.exist?(operations_file)

    puts "Splitting Operations.swift by operation groups..."
    content = File.read(operations_file)

    # Parse operation enums using more sophisticated approach
    operation_groups = parse_operations_by_groups(content)

    # Create Operations subdirectory
    operations_dir = File.join(@output_directory, 'Operations')
    FileUtils.mkdir_p(operations_dir)

    # Write group files
    operation_groups.each do |group, content_lines|
      filename = "Operations+#{capitalize_group_name(group)}.swift"
      filepath = File.join(operations_dir, filename)

      File.write(filepath, content_lines)
      puts "Created Operations/#{filename} (#{content_lines.lines.size} lines)"
    end

    # Remove original Operations.swift
    File.delete(operations_file)
    puts "Removed original Operations.swift"
  end

  def extract_components_structure(lines)
    # Find Components enum start and Schemas enum start
    components_start = lines.find_index { |line| line.strip.match(/^public enum Components/) }
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }

    return [lines, []] unless components_start && schemas_start

    header_lines = lines[0..schemas_start]
    schemas_content = lines[(schemas_start + 1)..-1]

    [header_lines, schemas_content]
  end

  def extract_operations_structure(lines)
    # Find Operations enum start
    operations_start = lines.find_index { |line| line.strip.match(/^public enum Operations/) }

    return [lines, []] unless operations_start

    header_lines = lines[0..operations_start]
    operations_content = lines[(operations_start + 1)..-1]

    [header_lines, operations_content]
  end

  def parse_schema_types(lines)
    groups = Hash.new { |h, k| h[k] = [] }
    current_type = nil
    current_lines = []
    brace_count = 0
    in_type = false

    lines.each do |line|
      stripped = line.strip

      # Check for top-level type declarations (struct, enum, etc.)
      if match = stripped.match(/^\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+)/)
        # Save previous type if any
        if current_type
          group = determine_schema_group(current_type)
          groups[group].concat(current_lines)
        end

        # Start new type
        current_type = $1
        current_lines = [line]
        in_type = true
        next
      elsif stripped.match(/^public (struct|enum) (\w+)/) && in_type
        current_lines << line
        brace_count = line.count('{') - line.count('}')
        next
      end

      # Add lines to current type
      if current_type
        current_lines << line
        brace_count += line.count('{') - line.count('}')

        # Check if we've closed the type declaration
        if in_type && brace_count == 0 && current_lines.size > 2
          group = determine_schema_group(current_type)
          groups[group].concat(current_lines)
          current_type = nil
          current_lines = []
          in_type = false
        end
      end
    end

    # Handle final type
    if current_type
      group = determine_schema_group(current_type)
      groups[group].concat(current_lines)
    end

    groups
  end

  def parse_operation_types(lines)
    groups = Hash.new { |h, k| h[k] = [] }
    current_operation = nil
    current_lines = []
    brace_count = 0
    in_operation = false

    lines.each do |line|
      stripped = line.strip

      # Check for operation declarations
      if match = stripped.match(/^public enum (\w+)/)
        # Save previous operation if any
        if current_operation
          group = extract_operation_group_name(current_operation)
          groups[group].concat(current_lines)
        end

        # Start new operation
        current_operation = $1
        current_lines = [line]
        brace_count = line.count('{') - line.count('}')
        in_operation = true
        next
      end

      # Add lines to current operation
      if current_operation
        current_lines << line
        brace_count += line.count('{') - line.count('}')

        # Check if we've closed the operation declaration
        if in_operation && brace_count == 0 && current_lines.size > 1
          group = extract_operation_group_name(current_operation)
          groups[group].concat(current_lines)
          current_operation = nil
          current_lines = []
          in_operation = false
        end
      end
    end

    # Handle final operation
    if current_operation
      group = extract_operation_group_name(current_operation)
      groups[group].concat(current_lines)
    end

    groups
  end

  def determine_schema_group(type_name)
    # Check if it's a response type
    if type_name.end_with?('Response')
      # Extract the prefix before "Response"
      prefix = type_name.gsub(/Response$/, '')
      # Find the first API group that matches
      group = API_GROUPS.find { |g| prefix.downcase.start_with?(g.downcase) }
      return capitalize_group_name(group) if group
    end

    # For non-response types, put in Common
    'Common'
  end

  def extract_operation_group_name(operation_name)
    # Operations follow the pattern AdminAppsActivitiesList, UsersInfo, etc.
    # Extract the first part that matches our API groups
    API_GROUPS.find { |group| operation_name.downcase.start_with?(group.downcase) } || 'unknown'
  end

  def generate_components_file_content(header_lines, group, types)
    content = header_lines.join
    if group == 'Common'
      content += types.join
      content += "    }\n}\n"
    else
      content += "        #if WebAPI_#{group}\n"
      content += types.join
      content += "        #endif\n"
      content += "    }\n}\n"
    end
    content
  end

  def parse_components_by_schemas(content)
    lines = content.lines
    groups = Hash.new { |h, k| h[k] = [] }

    # Find the header (everything up to Components enum)
    components_start = lines.find_index { |line| line.strip.match(/^public enum Components/) }
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }
    return {} unless components_start && schemas_start

    header = lines[0...components_start].join

    # Parse each schema struct
    current_schema = nil
    schema_lines = []
    brace_depth = 0
    in_schema = false

    lines[(schemas_start + 1)..-1].each do |line|
      stripped = line.strip

      # Look for schema struct declarations
      if match = stripped.match(/\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+)/)
        # Save previous schema
        if current_schema && !schema_lines.empty?
          group = determine_schema_group(current_schema)
          groups[group] << schema_lines.join
        end

        # Start new schema
        current_schema = $1
        schema_lines = [line]
        in_schema = true
        next
      elsif stripped.match(/^public struct (\w+):/) && in_schema
        schema_lines << line
        brace_depth = 1  # Start counting from the opening brace
        next
      end

      if in_schema && current_schema
        schema_lines << line
        brace_depth += line.count('{') - line.count('}')

        # End of schema structure
        if brace_depth == 0
          group = determine_schema_group(current_schema)
          groups[group] << schema_lines.join
          current_schema = nil
          schema_lines = []
          in_schema = false
        end
      end
    end

    # Handle final schema
    if current_schema && !schema_lines.empty?
      group = determine_schema_group(current_schema)
      groups[group] << schema_lines.join
    end

    # Generate complete file content for each group
    result = {}
    groups.each do |group, schemas|
      # Adjust indentation - remove 4 spaces from each line since we're moving from nested to extension
      adjusted_schemas = schemas.map { |schema| 
        schema.lines.map { |line| 
          # Remove 4 spaces of indentation if the line has enough leading spaces
          if line.start_with?('        ')  # 8 spaces originally
            '    ' + line[8..-1]  # Keep 4 spaces
          else
            line
          end
        }.join
      }
      
      if group == 'Common'
        content = header + "\nextension Components.Schemas {\n" + adjusted_schemas.join + "}\n"
      else
        content = header + "\n#if WebAPI_#{group}\nextension Components.Schemas {\n" +
                 adjusted_schemas.join + "}\n#endif\n"
      end
      
      # Apply transformations to remove CodingKeys and fix _type -> type
      content = transform_components_content(content)
      
      result[group] = content
    end

    result
  end

  def parse_operations_by_groups(content)
    lines = content.lines
    groups = Hash.new { |h, k| h[k] = [] }

    # Find the header (everything up to Operations enum)
    operations_start = lines.find_index { |line| line.strip.match(/^public enum Operations/) }
    return {} unless operations_start

    header = lines[0...operations_start].join

    # Parse each operation enum with proper brace counting
    current_operation = nil
    operation_lines = []
    brace_depth = 0
    in_operation = false
    line_index = operations_start + 1

    while line_index < lines.length
      line = lines[line_index]
      stripped = line.strip

      # Skip empty lines and comments outside operations
      if !in_operation && (stripped.empty? || stripped.start_with?('//') || stripped.start_with?('///'))
        line_index += 1
        next
      end

      # Look for operation enum declarations - must be at correct indentation level
      if !in_operation && stripped.match(/^public enum (\w+)\s*\{?$/)
        current_operation = $1
        operation_lines = [line]

        # Count opening brace on this line or next line
        if line.include?('{')
          brace_depth = 1
        else
          # Look for opening brace on next line
          brace_depth = 0
          if line_index + 1 < lines.length && lines[line_index + 1].strip == '{'
            line_index += 1
            operation_lines << lines[line_index]
            brace_depth = 1
          else
            brace_depth = 1  # Assume opening brace
          end
        end

        in_operation = true
        line_index += 1
        next
      end

      if in_operation && current_operation
        operation_lines << line

        # Count braces carefully
        open_braces = line.count('{')
        close_braces = line.count('}')
        brace_depth += open_braces - close_braces

        # Debug output for the problematic operations
        if current_operation.start_with?('Admin') && brace_depth < 0
          puts "WARNING: Negative brace depth #{brace_depth} at line #{line_index + 1}: #{line.strip}"
        end

        # End of operation enum - when we return to depth 0
        if brace_depth == 0
          group = extract_operation_group_name(current_operation)
          groups[group] << operation_lines.join
          current_operation = nil
          operation_lines = []
          in_operation = false
        elsif brace_depth < 0
          # Something went wrong with brace counting, force end
          puts "ERROR: Brace counting error for #{current_operation}, forcing end"
          brace_depth = 0
          group = extract_operation_group_name(current_operation)
          groups[group] << operation_lines.join
          current_operation = nil
          operation_lines = []
          in_operation = false
        end
      end

      line_index += 1
    end

    # Handle final operation
    if current_operation && !operation_lines.empty?
      group = extract_operation_group_name(current_operation)
      groups[group] << operation_lines.join
    end

    # Generate complete file content for each group
    result = {}
    groups.each do |group, operations|
      trait = "WebAPI_#{capitalize_group_name(group)}"
      
      # Adjust indentation - remove 4 spaces from each line since we're moving from nested to extension
      adjusted_operations = operations.map { |operation| 
        operation.lines.map { |line| 
          # Remove 4 spaces of indentation if the line has enough leading spaces
          if line.start_with?('    ')  # 4 spaces originally
            line[4..-1]  # Remove 4 spaces completely for top-level in extension
          else
            line
          end
        }.join
      }
      
      content = header + "\n#if #{trait}\nextension Operations {\n" +
               adjusted_operations.join + "}\n#endif\n"
      
      # Apply transformations to operations content
      content = transform_operations_content(content)
      
      result[group] = content
    end

    result
  end


  def apply_conditional_compilation_to_protocol(content)
    lines = content.lines
    updated_lines = []
    
    # Split content into protocol and extension parts
    protocol_start = lines.find_index { |line| line.strip.start_with?('public protocol APIProtocol') }
    extension_start = lines.find_index { |line| line.strip.start_with?('extension APIProtocol') }
    
    return content unless protocol_start
    
    if extension_start
      # Handle protocol part
      protocol_end = extension_start - 1
      # Skip backward to find the comment before extension
      while protocol_end > protocol_start && (lines[protocol_end].strip.empty? || lines[protocol_end].strip.start_with?('///'))
        protocol_end -= 1
      end
      
      protocol_lines = lines[0..protocol_end]
      extension_comment_and_after = lines[(protocol_end + 1)..-1]
      
      # Apply conditional compilation to protocol part
      updated_lines.concat(apply_conditional_compilation_to_protocol_declaration(protocol_lines))
      
      # Apply conditional compilation to extension part
      updated_lines.concat(apply_conditional_compilation_to_protocol_extension(extension_comment_and_after))
    else
      # Only protocol, no extension
      updated_lines.concat(apply_conditional_compilation_to_protocol_declaration(lines))
    end
    
    updated_lines.join
  end
  
  def apply_conditional_compilation_to_protocol_declaration(lines)
    updated_lines = []
    current_group = nil
    pending_lines = []
    in_protocol = false
    
    lines.each do |line|
      stripped = line.strip
      
      if stripped.start_with?('public protocol APIProtocol')
        in_protocol = true
        updated_lines << line
        next
      end
      
      if in_protocol && (match = stripped.match(/^func (\w+)/))
        func_name = $1
        new_group = extract_group_name(func_name)
        
        if current_group != new_group
          # Close previous group
          if current_group
            updated_lines.concat(pending_lines)
            updated_lines << "    #endif\n"
            pending_lines.clear
          end
          
          # Start new group
          if new_group != 'unknown'
            current_group = new_group
            updated_lines << "    #if WebAPI_#{capitalize_group_name(current_group)}\n"
          else
            current_group = nil
          end
        end
      elsif stripped == '}' && in_protocol
        # End of protocol
        if current_group
          updated_lines.concat(pending_lines)
          updated_lines << "    #endif\n"
          pending_lines.clear
        else
          updated_lines.concat(pending_lines)
          pending_lines.clear
        end
        
        updated_lines << line
        break
      end
      
      if in_protocol
        pending_lines << line
      else
        updated_lines << line
      end
    end
    
    updated_lines
  end
  
  def apply_conditional_compilation_to_protocol_extension(lines)
    updated_lines = []
    current_group = nil
    pending_lines = []
    in_extension = false
    brace_depth = 0
    
    lines.each_with_index do |line, index|
      stripped = line.strip
      
      if stripped.start_with?('extension APIProtocol')
        in_extension = true
        brace_depth = 0
        updated_lines << line
        next
      end
      
      if in_extension 
        # Look for function declarations BEFORE updating brace depth
        if (match = stripped.match(/^public func (\w+)/))
          func_name = $1
          new_group = extract_group_name(func_name)
          
          if current_group != new_group
            # Close previous group
            if current_group
              updated_lines.concat(pending_lines)
              updated_lines << "    #endif\n"
              pending_lines.clear
            end
            
            # Start new group
            if new_group != 'unknown'
              current_group = new_group
              updated_lines << "    #if WebAPI_#{capitalize_group_name(current_group)}\n"
            else
              current_group = nil
            end
          end
        end
        
        # Track brace depth AFTER checking for functions
        brace_depth += line.count('{') - line.count('}')
        
        # Check if this is the extension closing brace
        if stripped == '}' && brace_depth == -1
          # End of extension - this is the closing brace of the extension itself
          if current_group
            updated_lines.concat(pending_lines)
            updated_lines << "    #endif\n"
            pending_lines.clear
            current_group = nil
          else
            updated_lines.concat(pending_lines)
            pending_lines.clear
          end
          
          updated_lines << line
          break
        end
        
        pending_lines << line
      else
        updated_lines << line
      end
    end
    
    # Add any remaining lines if we didn't hit the closing brace
    if in_extension && !pending_lines.empty?
      if current_group
        updated_lines.concat(pending_lines)
        updated_lines << "    #endif\n"
      else
        updated_lines.concat(pending_lines)
      end
    end
    
    updated_lines
  end

  def create_base_files
    puts "Creating base files for Components and Operations..."
    
    # Read existing files to extract the declarations
    components_file = File.join(@input_directory, 'Components.swift')
    operations_file = File.join(@input_directory, 'Operations.swift')
    
    if File.exist?(components_file)
      create_components_base_file(components_file)
    end
    
    if File.exist?(operations_file)
      create_operations_base_file(operations_file)
    end
  end
  
  def create_components_base_file(components_file)
    content = File.read(components_file)
    lines = content.lines
    
    # Find the header and enum declarations
    components_start = lines.find_index { |line| line.strip.match(/^public enum Components/) }
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }
    
    return unless components_start && schemas_start
    
    # Extract header and enum declarations
    header = lines[0...components_start].join
    components_decl = lines[components_start]
    schemas_decl = lines[schemas_start]
    
    # Create base file content
    base_content = header + components_decl + schemas_decl + "    }\n}\n"
    
    # Create Components subdirectory and write base file
    components_dir = File.join(@output_directory, 'Components')
    FileUtils.mkdir_p(components_dir)
    
    File.write(File.join(components_dir, 'Components+Base.swift'), base_content)
    puts "Created Components/Components+Base.swift"
  end
  
  def create_operations_base_file(operations_file)
    content = File.read(operations_file)
    lines = content.lines
    
    # Find the header and enum declaration
    operations_start = lines.find_index { |line| line.strip.match(/^public enum Operations/) }
    
    return unless operations_start
    
    # Extract header and enum declaration
    header = lines[0...operations_start].join
    operations_decl = lines[operations_start]
    
    # Create base file content
    base_content = header + operations_decl + "}\n"
    
    # Create Operations subdirectory and write base file
    operations_dir = File.join(@output_directory, 'Operations')
    FileUtils.mkdir_p(operations_dir)
    
    File.write(File.join(operations_dir, 'Operations+Base.swift'), base_content)
    puts "Created Operations/Operations+Base.swift"
  end

  def transform_components_content(content)
    lines = content.lines
    transformed_lines = []
    skip_until_end = false
    brace_depth = 0
    needs_slackblockkit_import = false
    
    lines.each do |line|
      stripped = line.strip
      
      # Skip CodingKeys enum completely
      if stripped.match(/^public enum CodingKeys:/)
        skip_until_end = true
        brace_depth = 0
        next
      end
      
      if skip_until_end
        brace_depth += line.count('{') - line.count('}')
        if brace_depth < 0 && stripped == '}'
          skip_until_end = false
        end
        next
      end
      
      # Transform _type property to type
      if line.include?('_type')
        line = line.gsub(/\b_type\b/, 'type')
      end
      
      # Replace Components.Schemas.View with SlackBlockKit.ViewType (exact match only)
      if line.match(/\bComponents\.Schemas\.View\b/)
        line = line.gsub(/\bComponents\.Schemas\.View\b/, 'SlackBlockKit.ViewType')
        needs_slackblockkit_import = true
      end
      
      # Replace Components.Schemas.Block with SlackBlockKit.BlockType (exact match only)
      if line.match(/\bComponents\.Schemas\.Block\b/)
        line = line.gsub(/\bComponents\.Schemas\.Block\b/, 'SlackBlockKit.BlockType')
        needs_slackblockkit_import = true
      end
      
      transformed_lines << line
    end
    
    # Add SlackBlockKit import if needed
    if needs_slackblockkit_import
      # Find the end of the conditional import block (#endif)
      endif_index = transformed_lines.find_index { |line| line.strip == '#endif' }
      if endif_index
        # Insert after #endif
        transformed_lines.insert(endif_index + 1, "\n#if canImport(SlackBlockKit)\nimport SlackBlockKit\n#endif\n")
      else
        # No conditional block found, add at the end of imports
        last_import_index = transformed_lines.rindex { |line| line.strip.start_with?('import ') }
        if last_import_index
          transformed_lines.insert(last_import_index + 1, "\n#if canImport(SlackBlockKit)\nimport SlackBlockKit\n#endif\n")
        else
          transformed_lines.unshift("#if canImport(SlackBlockKit)\nimport SlackBlockKit\n#endif\n")
        end
      end
    end
    
    transformed_lines.join
  end
end

# Handles splitting of Types.swift into individual declaration files
class TypesSplitter
  def initialize(types_file, output_directory)
    @types_file = types_file
    @output_directory = output_directory
  end
  
  # Splits Types.swift by top-level declarations with conditional compilation
  def split_types_file
    return unless File.exist?(@types_file)

    puts "Splitting Types.swift by top-level declarations..."
    content = File.read(@types_file)
    lines = content.lines

    # Find top-level declaration blocks
    blocks = parse_types_blocks(lines)

    # Write individual files
    blocks.each do |name, block_lines|
      filename = "#{name}.swift"
      filepath = File.join(@output_directory, filename)

      # Apply conditional compilation to APIProtocol
      if name == 'APIProtocol'
        content = ProtocolConditionalCompiler.apply_conditional_compilation_to_protocol(block_lines.join)
        File.write(filepath, content)
      else
        File.write(filepath, block_lines.join)
      end

      puts "Created #{filename} (#{block_lines.size} lines)"
    end
  end
  
  private
  
  # Parses Types.swift into separate top-level blocks
  def parse_types_blocks(lines)
    blocks = {}
    header_lines = []
    top_level_blocks = ['APIProtocol', 'Servers', 'Components', 'Operations']

    # Collect header lines (imports, etc.) before first declaration - excluding any documentation
    first_declaration_idx = lines.find_index { |line| line.strip.match(/^public (protocol|enum)/) }
    return {} unless first_declaration_idx

    # Find the start of documentation for the first declaration
    first_doc_start = find_documentation_start(lines, first_declaration_idx)
    header_lines = lines[0...first_doc_start]

    # Find boundaries of each top-level block with their documentation
    block_info = {}
    lines.each_with_index do |line, index|
      stripped = line.strip
      if match = stripped.match(/^public (protocol|enum) (\w+)/)
        block_name = $2
        if top_level_blocks.include?(block_name)
          # Find the start of documentation for this block
          doc_start_idx = find_documentation_start(lines, index)
          block_info[block_name] = {
            doc_start: doc_start_idx,
            decl_start: index
          }
        end
      end
    end

    # Sort blocks by their declaration positions
    sorted_blocks = block_info.sort_by { |name, info| info[:decl_start] }

    # Extract content for each block
    sorted_blocks.each_with_index do |(block_name, info), i|
      start_idx = info[:doc_start]
      end_idx = if i < sorted_blocks.length - 1
        next_block_info = sorted_blocks[i + 1][1]
        find_documentation_start(lines, next_block_info[:decl_start]) - 1
      else
        lines.length - 1
      end

      block_lines = lines[start_idx..end_idx]
      blocks[block_name] = header_lines + block_lines
    end

    blocks
  end
  
  # Finds the start of documentation for a declaration by looking backwards
  def find_documentation_start(lines, decl_index)
    doc_start = decl_index
    (decl_index - 1).downto(0) do |i|
      line = lines[i].strip
      if line.start_with?('///') || line.start_with?('/// ') || line == '///'
        doc_start = i
      elsif line.empty?
        # Allow empty lines within documentation blocks
        next
      else
        # Hit non-documentation, non-empty line - stop
        break
      end
    end
    doc_start
  end
end

# Handles conditional compilation for protocol declarations
class ProtocolConditionalCompiler
  # Applies conditional compilation to APIProtocol for trait-based compilation
  def self.apply_conditional_compilation_to_protocol(content)
    lines = content.lines
    updated_lines = []
    
    # Split content into protocol and extension parts
    protocol_start = lines.find_index { |line| line.strip.start_with?('public protocol APIProtocol') }
    extension_start = lines.find_index { |line| line.strip.start_with?('extension APIProtocol') }
    
    return content unless protocol_start
    
    if extension_start
      # Handle protocol part
      protocol_end = extension_start - 1
      # Skip backward to find the comment before extension
      while protocol_end > protocol_start && (lines[protocol_end].strip.empty? || lines[protocol_end].strip.start_with?('///'))
        protocol_end -= 1
      end
      
      protocol_lines = lines[0..protocol_end]
      extension_comment_and_after = lines[(protocol_end + 1)..-1]
      
      # Apply conditional compilation to protocol part
      updated_lines.concat(apply_conditional_compilation_to_protocol_declaration(protocol_lines))
      
      # Apply conditional compilation to extension part
      updated_lines.concat(apply_conditional_compilation_to_protocol_extension(extension_comment_and_after))
    else
      # Only protocol, no extension
      updated_lines.concat(apply_conditional_compilation_to_protocol_declaration(lines))
    end
    
    updated_lines.join
  end
  
  private
  
  # Applies conditional compilation to the protocol declaration
  def self.apply_conditional_compilation_to_protocol_declaration(lines)
    updated_lines = []
    current_group = nil
    pending_lines = []
    in_protocol = false
    
    lines.each do |line|
      stripped = line.strip
      
      if stripped.start_with?('public protocol APIProtocol')
        in_protocol = true
        updated_lines << line
        next
      end
      
      if in_protocol && (match = stripped.match(/^func (\w+)/))
        func_name = $1
        new_group = ClientFunctionParser.extract_group_name(func_name)
        
        if current_group != new_group
          # Close previous group
          if current_group
            updated_lines.concat(pending_lines)
            updated_lines << "    #endif\n"
            pending_lines.clear
          end
          
          # Start new group
          if new_group != 'unknown'
            current_group = new_group
            updated_lines << "    #if WebAPI_#{GroupNameFormatter.capitalize_group_name(current_group)}\n"
          else
            current_group = nil
          end
        end
      elsif stripped == '}' && in_protocol
        # End of protocol
        if current_group
          updated_lines.concat(pending_lines)
          updated_lines << "    #endif\n"
          pending_lines.clear
        else
          updated_lines.concat(pending_lines)
          pending_lines.clear
        end
        
        updated_lines << line
        break
      end
      
      if in_protocol
        pending_lines << line
      else
        updated_lines << line
      end
    end
    
    updated_lines
  end
  
  # Applies conditional compilation to the protocol extension
  def self.apply_conditional_compilation_to_protocol_extension(lines)
    updated_lines = []
    current_group = nil
    pending_lines = []
    in_extension = false
    brace_depth = 0
    
    lines.each_with_index do |line, index|
      stripped = line.strip
      
      if stripped.start_with?('extension APIProtocol')
        in_extension = true
        brace_depth = 0
        updated_lines << line
        next
      end
      
      if in_extension 
        # Look for function declarations BEFORE updating brace depth
        if (match = stripped.match(/^public func (\w+)/))
          func_name = $1
          new_group = ClientFunctionParser.extract_group_name(func_name)
          
          if current_group != new_group
            # Close previous group
            if current_group
              updated_lines.concat(pending_lines)
              updated_lines << "    #endif\n"
              pending_lines.clear
            end
            
            # Start new group
            if new_group != 'unknown'
              current_group = new_group
              updated_lines << "    #if WebAPI_#{GroupNameFormatter.capitalize_group_name(current_group)}\n"
            else
              current_group = nil
            end
          end
        end
        
        # Track brace depth AFTER checking for functions
        brace_depth += line.count('{') - line.count('}')
        
        # Check if this is the extension closing brace
        if stripped == '}' && brace_depth == -1
          # End of extension - this is the closing brace of the extension itself
          if current_group
            updated_lines.concat(pending_lines)
            updated_lines << "    #endif\n"
            pending_lines.clear
            current_group = nil
          else
            updated_lines.concat(pending_lines)
            pending_lines.clear
          end
          
          updated_lines << line
          break
        end
        
        pending_lines << line
      else
        updated_lines << line
      end
    end
    
    # Add any remaining lines if we didn't hit the closing brace
    if in_extension && !pending_lines.empty?
      if current_group
        updated_lines.concat(pending_lines)
        updated_lines << "    #endif\n"
      else
        updated_lines.concat(pending_lines)
      end
    end
    
    updated_lines
  end
end

# Creates base files for Components and Operations enums
class BaseFileCreator
  def initialize(input_directory, output_directory)
    @input_directory = input_directory
    @output_directory = output_directory
  end
  
  # Creates base declaration files for Components and Operations
  def create_base_files
    puts "Creating base files for Components and Operations..."
    
    # Read existing files to extract the declarations
    components_file = File.join(@input_directory, 'Components.swift')
    operations_file = File.join(@input_directory, 'Operations.swift')
    
    if File.exist?(components_file)
      create_components_base_file(components_file)
    end
    
    if File.exist?(operations_file)
      create_operations_base_file(operations_file)
    end
  end
  
  private
  
  # Creates the base Components file with enum declarations only
  def create_components_base_file(components_file)
    content = File.read(components_file)
    lines = content.lines
    
    # Find the header and enum declarations
    components_start = lines.find_index { |line| line.strip.match(/^public enum Components/) }
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }
    
    return unless components_start && schemas_start
    
    # Extract header and enum declarations
    header = lines[0...components_start].join
    components_decl = lines[components_start]
    schemas_decl = lines[schemas_start]
    
    # Create base file content
    base_content = header + components_decl + schemas_decl + "    }\n}\n"
    
    # Create Components subdirectory and write base file
    components_dir = File.join(@output_directory, 'Components')
    FileUtils.mkdir_p(components_dir)
    
    File.write(File.join(components_dir, 'Components+Base.swift'), base_content)
    puts "Created Components/Components+Base.swift"
  end
  
  # Creates the base Operations file with enum declaration only
  def create_operations_base_file(operations_file)
    content = File.read(operations_file)
    lines = content.lines
    
    # Find the header and enum declaration
    operations_start = lines.find_index { |line| line.strip.match(/^public enum Operations/) }
    
    return unless operations_start
    
    # Extract header and enum declaration
    header = lines[0...operations_start].join
    operations_decl = lines[operations_start]
    
    # Create base file content
    base_content = header + operations_decl + "}\n"
    
    # Create Operations subdirectory and write base file
    operations_dir = File.join(@output_directory, 'Operations')
    FileUtils.mkdir_p(operations_dir)
    
    File.write(File.join(operations_dir, 'Operations+Base.swift'), base_content)
    puts "Created Operations/Operations+Base.swift"
  end
end

# Handles splitting of Components.swift by schema groups
class ComponentsSplitter
  def initialize(output_directory)
    @output_directory = output_directory
  end
  
  # Splits Components.swift into group-specific files with conditional compilation
  def split_components_file
    components_file = File.join(@output_directory, 'Components.swift')
    return unless File.exist?(components_file)

    puts "Splitting Components.swift by schema groups..."
    content = File.read(components_file)

    # Parse component schemas using more sophisticated approach
    schema_groups = parse_components_by_schemas(content)

    # Create Components subdirectory
    components_dir = File.join(@output_directory, 'Components')
    FileUtils.mkdir_p(components_dir)

    # Write group files
    schema_groups.each do |group, content_lines|
      filename = if group == 'Common'
        'Components+Common.swift'
      else
        "Components+#{GroupNameFormatter.capitalize_group_name(group)}.swift"
      end
      filepath = File.join(components_dir, filename)

      File.write(filepath, content_lines)
      puts "Created Components/#{filename} (#{content_lines.lines.size} lines)"
    end

    # Remove original Components.swift
    File.delete(components_file)
    puts "Removed original Components.swift"
  end
  
  private
  
  # Parses Components.swift content and groups schemas by API groups
  def parse_components_by_schemas(content)
    lines = content.lines
    groups = Hash.new { |h, k| h[k] = [] }

    # Find the header (everything up to Components enum)
    components_start = lines.find_index { |line| line.strip.match(/^public enum Components/) }
    schemas_start = lines.find_index { |line| line.strip.match(/^public enum Schemas/) }
    return {} unless components_start && schemas_start

    header = lines[0...components_start].join

    # Parse each schema struct
    current_schema = nil
    schema_lines = []
    brace_depth = 0
    in_schema = false

    lines[(schemas_start + 1)..-1].each do |line|
      stripped = line.strip

      # Look for schema struct declarations
      if match = stripped.match(/\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+)/)
        # Save previous schema
        if current_schema && !schema_lines.empty?
          group = SchemaGroupDeterminer.determine_schema_group(current_schema)
          groups[group] << schema_lines.join
        end

        # Start new schema
        current_schema = $1
        schema_lines = [line]
        in_schema = true
        next
      elsif stripped.match(/^public struct (\w+):/) && in_schema
        schema_lines << line
        brace_depth = 1  # Start counting from the opening brace
        next
      end

      if in_schema && current_schema
        schema_lines << line
        brace_depth += line.count('{') - line.count('}')

        # End of schema structure
        if brace_depth == 0
          group = SchemaGroupDeterminer.determine_schema_group(current_schema)
          groups[group] << schema_lines.join
          current_schema = nil
          schema_lines = []
          in_schema = false
        end
      end
    end

    # Handle final schema
    if current_schema && !schema_lines.empty?
      group = SchemaGroupDeterminer.determine_schema_group(current_schema)
      groups[group] << schema_lines.join
    end

    # Generate complete file content for each group
    result = {}
    groups.each do |group, schemas|
      # Adjust indentation - remove 4 spaces from each line since we're moving from nested to extension
      adjusted_schemas = schemas.map { |schema| 
        schema.lines.map { |line| 
          # Remove 4 spaces of indentation if the line has enough leading spaces
          if line.start_with?('        ')  # 8 spaces originally
            '    ' + line[8..-1]  # Keep 4 spaces
          else
            line
          end
        }.join
      }
      
      if group == 'Common'
        content = header + "\nextension Components.Schemas {\n" + adjusted_schemas.join + "}\n"
      else
        content = header + "\n#if WebAPI_#{group}\nextension Components.Schemas {\n" +
                 adjusted_schemas.join + "}\n#endif\n"
      end
      
      # Apply transformations to remove CodingKeys and fix _type -> type
      content = CodeTransformer.transform_components_content(content)
      
      result[group] = content
    end

    result
  end
end

# Handles splitting of Operations.swift by operation groups
class OperationsSplitter
  def initialize(output_directory)
    @output_directory = output_directory
  end
  
  # Splits Operations.swift into group-specific files with conditional compilation
  def split_operations_file
    operations_file = File.join(@output_directory, 'Operations.swift')
    return unless File.exist?(operations_file)

    puts "Splitting Operations.swift by operation groups..."
    content = File.read(operations_file)

    # Parse operation enums using more sophisticated approach
    operation_groups = parse_operations_by_groups(content)

    # Create Operations subdirectory
    operations_dir = File.join(@output_directory, 'Operations')
    FileUtils.mkdir_p(operations_dir)

    # Write group files
    operation_groups.each do |group, content_lines|
      filename = "Operations+#{GroupNameFormatter.capitalize_group_name(group)}.swift"
      filepath = File.join(operations_dir, filename)

      File.write(filepath, content_lines)
      puts "Created Operations/#{filename} (#{content_lines.lines.size} lines)"
    end

    # Remove original Operations.swift
    File.delete(operations_file)
    puts "Removed original Operations.swift"
  end
  
  private
  
  # Parses Operations.swift content and groups operations by API groups
  def parse_operations_by_groups(content)
    lines = content.lines
    groups = Hash.new { |h, k| h[k] = [] }

    # Find the header (everything up to Operations enum)
    operations_start = lines.find_index { |line| line.strip.match(/^public enum Operations/) }
    return {} unless operations_start

    header = lines[0...operations_start].join

    # Parse each operation enum with proper brace counting
    current_operation = nil
    operation_lines = []
    brace_depth = 0
    in_operation = false
    line_index = operations_start + 1

    while line_index < lines.length
      line = lines[line_index]
      stripped = line.strip

      # Skip empty lines and comments outside operations
      if !in_operation && (stripped.empty? || stripped.start_with?('//') || stripped.start_with?('///'))
        line_index += 1
        next
      end

      # Look for operation enum declarations - must be at correct indentation level
      if !in_operation && stripped.match(/^public enum (\w+)\s*\{?$/)
        current_operation = $1
        operation_lines = [line]

        # Count opening brace on this line or next line
        if line.include?('{')
          brace_depth = 1
        else
          # Look for opening brace on next line
          brace_depth = 0
          if line_index + 1 < lines.length && lines[line_index + 1].strip == '{'
            line_index += 1
            operation_lines << lines[line_index]
            brace_depth = 1
          else
            brace_depth = 1  # Assume opening brace
          end
        end

        in_operation = true
        line_index += 1
        next
      end

      if in_operation && current_operation
        operation_lines << line

        # Count braces carefully
        open_braces = line.count('{')
        close_braces = line.count('}')
        brace_depth += open_braces - close_braces

        # Debug output for the problematic operations
        if current_operation.start_with?('Admin') && brace_depth < 0
          puts "WARNING: Negative brace depth #{brace_depth} at line #{line_index + 1}: #{line.strip}"
        end

        # End of operation enum - when we return to depth 0
        if brace_depth == 0
          group = OperationGroupExtractor.extract_operation_group_name(current_operation)
          groups[group] << operation_lines.join
          current_operation = nil
          operation_lines = []
          in_operation = false
        elsif brace_depth < 0
          # Something went wrong with brace counting, force end
          puts "ERROR: Brace counting error for #{current_operation}, forcing end"
          brace_depth = 0
          group = OperationGroupExtractor.extract_operation_group_name(current_operation)
          groups[group] << operation_lines.join
          current_operation = nil
          operation_lines = []
          in_operation = false
        end
      end

      line_index += 1
    end

    # Handle final operation
    if current_operation && !operation_lines.empty?
      group = OperationGroupExtractor.extract_operation_group_name(current_operation)
      groups[group] << operation_lines.join
    end

    # Generate complete file content for each group
    result = {}
    groups.each do |group, operations|
      trait = "WebAPI_#{GroupNameFormatter.capitalize_group_name(group)}"
      
      # Adjust indentation - remove 4 spaces from each line since we're moving from nested to extension
      adjusted_operations = operations.map { |operation| 
        operation.lines.map { |line| 
          # Remove 4 spaces of indentation if the line has enough leading spaces
          if line.start_with?('    ')  # 4 spaces originally
            line[4..-1]  # Remove 4 spaces completely for top-level in extension
          else
            line
          end
        }.join
      }
      
      content = header + "\n#if #{trait}\nextension Operations {\n" +
               adjusted_operations.join + "}\n#endif\n"
      
      # Apply transformations to operations content
      content = CodeTransformer.transform_operations_content(content)
      
      result[group] = content
    end

    result
  end
end

# Utility class for determining which API group a schema belongs to
class SchemaGroupDeterminer
  # Determines the API group for a given schema type name
  def self.determine_schema_group(type_name)
    # Check if it's a response type
    if type_name.end_with?('Response')
      # Extract the prefix before "Response"
      prefix = type_name.gsub(/Response$/, '')
      # Find the first API group that matches
      group = ClientFunctionParser::API_GROUPS.find { |g| prefix.downcase.start_with?(g.downcase) }
      return GroupNameFormatter.capitalize_group_name(group) if group
    end

    # For non-response types, put in Common
    'Common'
  end
end

# Utility class for extracting API group names from operation names
class OperationGroupExtractor
  # Extracts the API group name from an operation name
  def self.extract_operation_group_name(operation_name)
    # Operations follow the pattern AdminAppsActivitiesList, UsersInfo, etc.
    # Extract the first part that matches our API groups
    ClientFunctionParser::API_GROUPS.find { |group| operation_name.downcase.start_with?(group.downcase) } || 'unknown'
  end
end

if __FILE__ == $0
  if ARGV.empty?
    CodeGenerationProcessor.run
  elsif ARGV.length == 1
    # Backward compatibility: single argument is treated as output directory
    output_directory = ARGV[0]
    unless Dir.exist?(output_directory)
      puts "Error: Output directory '#{output_directory}' does not exist"
      exit 1
    end
    CodeGenerationProcessor.run(nil, output_directory)
  else
    # Two arguments: input and output directories
    input_directory = ARGV[0]
    output_directory = ARGV[1]
    
    unless Dir.exist?(input_directory)
      puts "Error: Input directory '#{input_directory}' does not exist"
      exit 1
    end
    
    # Create output directory if it doesn't exist
    FileUtils.mkdir_p(output_directory)
    
    CodeGenerationProcessor.run(input_directory, output_directory)
  end
end
