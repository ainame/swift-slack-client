#!/usr/bin/env ruby
require 'json'
require 'time'

def main
  check_prerequisites

  new_tag, latest_tag = get_version

  # Confirm
  print "Create release #{new_tag}? (y/N): "
  exit unless gets.strip.downcase == 'y'

  # Test and build
  puts "Running tests..."
  system('swift test') or abort "Tests failed"
  system('swift build') or abort "Build failed"

  # Create tag and release
  system("git tag -a #{new_tag} -m 'Release #{new_tag}'")
  system("git push origin #{new_tag}")

  changelog = generate_changelog(new_tag, latest_tag)
  File.write("CHANGELOG_#{new_tag}.md", changelog)

  system("gh release create #{new_tag} --title 'Release #{new_tag}' --notes-file CHANGELOG_#{new_tag}.md --draft")
  File.delete("CHANGELOG_#{new_tag}.md")

  puts "\n✅ Draft release created! Review at: https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)/releases"
end

# Check prerequisites
def check_prerequisites
  unless system('gh', 'auth', 'status', out: File::NULL, err: File::NULL)
    abort "Error: GitHub CLI not authenticated. Run: gh auth login"
  end

  unless `git status --porcelain`.empty?
    abort "Error: Uncommitted changes. Please commit or stash first."
  end
end

# Get version from user
def get_version(version = nil)
  latest_tag = `git describe --tags --abbrev=0 2>/dev/null`.strip
  puts "Latest tag: #{latest_tag.empty? ? 'none' : latest_tag}"

  if version.nil?
    print "New version (e.g., 0.1.0): "
    version = gets.strip
  end
  
  abort "Invalid version format" unless version =~ /^\d+\.\d+\.\d+$/

  ["v#{version}", latest_tag]
end

# Generate changelog
def generate_changelog(new_tag, latest_tag)
  puts "Generating changelog..."

  # Get merged PRs
  search = latest_tag.empty? ? "" : "merged:>#{`git log -1 --format=%ai #{latest_tag}`.strip}"
  prs = JSON.parse(`gh pr list --state merged --limit 100 --search "#{search}" --json number,title,author`)

  changelog = ["# Release #{new_tag}", "", "## What's Changed", ""]
  changelog += prs.map { |pr| "* #{pr['title']} by @#{pr['author']['login']} in ##{pr['number']}" }

  # Contributors
  contributors = prs.map { |pr| pr['author']['login'] }.uniq.sort
  changelog += ["", "## Contributors", ""] + contributors.map { |c| "* @#{c}" }

  unless latest_tag.empty?
    repo = JSON.parse(`gh repo view --json nameWithOwner`)['nameWithOwner']
    changelog << ""
    changelog << "**Full Changelog**: https://github.com/#{repo}/compare/#{latest_tag}...#{new_tag}"
  end

  changelog.join("\n")
end

# Run main
main if __FILE__ == $0
