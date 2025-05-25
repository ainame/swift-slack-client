require 'fileutils'
require_relative '../content_transformer'
require_relative '../import_manager'
require_relative '../output'

# Extracts individual model types from Types.swift and creates SlackModels
class SlackModelsExtractor
  def initialize(types_file, output_dir)
    @types_file = types_file
    @output_dir = output_dir
    @manually_handled_types = %w[View Block]  # These are handled by SlackBlockKit
  end

  def extract
    content = File.read(@types_file)
    lines = content.lines

    # Find Components.Schemas enum
    components_start = lines.find_index { |line| line.strip.start_with?('public enum Components') }
    schemas_start = lines.find_index { |line| line.strip.start_with?('public enum Schemas') }

    unless components_start && schemas_start
      Output.info "Could not find Components.Schemas enum in Types.swift"
      return
    end

    header = lines[0...components_start].join

    # Create output directory
    FileUtils.mkdir_p(@output_dir)

    # Parse schemas
    schemas = parse_schemas(lines, schemas_start)

    Output.info "Found #{schemas.size} schemas to extract"

    # Filter for non-response types that should go to SlackModels
    model_schemas = schemas.select do |name, _|
      should_extract_to_slackmodels?(name)
    end

    Output.info "Extracting #{model_schemas.size} schemas to SlackModels"

    # Write each schema to its own file
    model_schemas.each do |name, content|
      write_model_file(name, content, header)
    end

    Output.info "Created #{model_schemas.size} model files"
  end

  private

  def parse_schemas(lines, schemas_start)
    schemas = {}
    current_schema = nil
    schema_lines = []
    brace_depth = 0
    in_schema = false

    lines[(schemas_start + 1)..-1].each do |line|
      stripped = line.strip

      # Look for schema struct declarations
      if match = stripped.match(/\/\/\/ - Remark: Generated from `#\/components\/schemas\/(\w+)`\.$/)
        # Save previous schema
        if current_schema && !schema_lines.empty?
          schemas[current_schema] = schema_lines.join
        end

        # Start new schema
        current_schema = $1
        schema_lines = [line]
        in_schema = false  # Wait for struct declaration
        next
      elsif stripped.match(/^public struct ([_\w]+):/) && current_schema
        # Get the actual struct name from the declaration and use that as the key
        actual_struct_name = $1

        # If the actual struct name is different from comment name (like _Error vs Error), use actual name
        if actual_struct_name != current_schema
          # Save with actual struct name instead
          if schemas[current_schema]  # If we already saved with comment name, remove it
            schemas.delete(current_schema)
          end
          current_schema = actual_struct_name
        end

        schema_lines << line
        brace_depth = 1  # Start counting from opening brace
        in_schema = true
        next
      end

      if in_schema && current_schema
        schema_lines << line
        brace_depth += line.count('{') - line.count('}')

        # End of schema
        if brace_depth == 0
          schemas[current_schema] = schema_lines.join
          current_schema = nil
          schema_lines = []
          in_schema = false
        end
      elsif current_schema
        # We're collecting lines for a schema but haven't hit the struct yet
        schema_lines << line
      end
    end

    # Handle final schema
    if current_schema && !schema_lines.empty?
      schemas[current_schema] = schema_lines.join
    end

    schemas
  end

  def should_extract_to_slackmodels?(schema_name)
    # Don't extract Response types - they stay in WebAPI
    return false if schema_name.end_with?('Response')

    # Don't extract manually handled types
    return false if @manually_handled_types.include?(schema_name)

    # Extract everything else
    true
  end

  def write_model_file(schema_name, content, header)
    # Transform the content
    transformed_content = transform_content(content, schema_name)

    # Check if we need SlackBlockKit import
    needs_slackblockkit_import = transformed_content.include?('ViewType') ||
                                transformed_content.include?('BlockType')

    # Generate file content
    file_content = ImportManager.generate_slackmodels_imports(needs_slackblockkit: needs_slackblockkit_import) + 
                   transformed_content.strip + "\n"

    # Write file
    filename = "#{schema_name}.swift"
    filepath = File.join(@output_dir, filename)
    File.write(filepath, file_content)
    Output.created filename
  end

  def transform_content(content, schema_name)
    lines = content.lines
    transformed_lines = []
    skip_until_end = false
    brace_depth = 0

    lines.each do |line|
      stripped = line.strip

      # Skip CodingKeys enum
      if stripped.match(/^public enum CodingKeys:/)
        skip_until_end = true
        brace_depth = 1
        next
      end

      if skip_until_end
        brace_depth += line.count('{') - line.count('}')
        if brace_depth <= 0
          skip_until_end = false
        end
        next
      end

      # Transform struct declaration
      if line.match(/^(\s*)public struct #{Regexp.escape(schema_name)}:/)
        line = line.gsub(/:\s*.*$/, ': Codable, Hashable, Sendable {')
      end

      # Apply transformations using ContentTransformer
      line = ContentTransformer.transform_type_properties(line)
      line = ContentTransformer.transform_blockkit_references(line)
      line = ContentTransformer.clean_remaining_schema_references(line)

      # Fix indentation: convert from enum nesting to top-level
      if line.start_with?('        ')  # 8 spaces from nested enum
        line = line[8..-1]
      elsif line.start_with?('    ')   # 4 spaces
        line = line[4..-1]
      end

      transformed_lines << line
    end

    transformed_lines.join
  end
end