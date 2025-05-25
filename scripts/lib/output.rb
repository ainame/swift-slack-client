# Structured output utilities for consistent script logging
module Output
  def self.step(message)
    puts "#{message}..."
  end

  def self.created(filename, lines = nil)
    suffix = lines ? " (#{lines} lines)" : ""
    puts "Created #{filename}#{suffix}"
  end

  def self.section(title)
    puts "\n#{title}"
  end

  def self.info(message)
    puts message
  end

  def self.summary(title, items)
    puts "\n#{title}"
    items.each { |item| puts "  - #{item}" }
  end
end