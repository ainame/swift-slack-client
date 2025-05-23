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

      # Additional properties should be allowed but don't need to be decoded
      data.delete('additionalProperties') if data.key?('additionalProperties')

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

        camel_case_key = key.camelize
        data[camel_case_key] = value
        data.delete(key)
      end
    else
      data
    end
  end
end

# Force UpperCamelCase for acronyms; ie DND -> Dnd
# quicktype unintentionally choose capital case for acronyms
class AcronymsFixer
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def walk(root)
    visit(root)
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
        acronyms = @dictionary.keys.find { key =~ /#{_1}/ }
        next unless acronyms

        correct_case = @dictionary[acronyms]
        camel_case_key = key.gsub(acronyms) { correct_case }
        data[camel_case_key] = value
        data.delete(key)
      end
    else
      if data.is_a?(String) && acronyms = @dictionary.keys.find { data =~ /#{_1}/ }
        correct_case = @dictionary[acronyms]
        data.gsub!(acronyms) { correct_case }
      else
        data
      end
    end
  end
end
