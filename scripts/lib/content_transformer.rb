# Centralized content transformation utilities for code generation
module ContentTransformer
  # Transforms _type properties to type (used in multiple files)
  def self.transform_type_properties(content)
    content.gsub(/\b_type\b/, 'type')
  end

  # Transforms Block Kit references (used in multiple files)
  def self.transform_blockkit_references(content)
    content
      .gsub(/\bComponents\.Schemas\.View\b/, 'ViewType')
      .gsub(/\bComponents\.Schemas\.Block\b/, 'BlockType')
  end

  # Transforms schema references to SlackModels for moved types only
  def self.transform_schema_references(content, moved_types)
    moved_types.each do |type|
      content = content.gsub(/\bComponents\.Schemas\.#{Regexp.escape(type)}\b/, "SlackModels.#{type}")
    end
    content
  end

  # Cleans remaining Components.Schemas references to just the type name
  def self.clean_remaining_schema_references(content)
    content.gsub(/\bComponents\.Schemas\.(\w+)\b/, '\1')
  end

  # Applies all transformations commonly used in model extraction
  def self.transform_model_content(content, schema_name)
    # Transform struct declaration
    content = content.gsub(/^(\s*)public struct #{Regexp.escape(schema_name)}:.*$/, '\1public struct \2: Codable, Hashable, Sendable {')
    
    # Transform _type property to type
    content = transform_type_properties(content)
    
    # Transform Block Kit references  
    content = transform_blockkit_references(content)
    
    # Clean remaining schema references
    content = clean_remaining_schema_references(content)
    
    content
  end
end