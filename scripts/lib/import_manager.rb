# Utilities for generating consistent import statements
class ImportManager
  def self.generate_standard_imports
    [
      "@_spi(Generated) import OpenAPIRuntime",
      "#if os(Linux)",
      "@preconcurrency import struct Foundation.URL",
      "@preconcurrency import struct Foundation.Data",
      "@preconcurrency import struct Foundation.Date",
      "#else",
      "import struct Foundation.URL",
      "import struct Foundation.Data",
      "import struct Foundation.Date",
      "#endif"
    ].join("\n")
  end

  def self.generate_slackmodels_imports(needs_slackblockkit: false)
    imports = [generate_standard_imports]
    
    if needs_slackblockkit
      imports << ""
      imports << "#if canImport(SlackBlockKit)"
      imports << "import SlackBlockKit"
      imports << "#endif"
    end
    
    imports.join("\n") + "\n\n"
  end

  def self.generate_conditional_import(condition, import_statement)
    "#if #{condition}\n#{import_statement}\n#endif"
  end
end