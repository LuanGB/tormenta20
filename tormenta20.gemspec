# frozen_string_literal: true

require_relative "src/ruby/tormenta20/version"

Gem::Specification.new do |spec|
  spec.name = "tormenta20"
  spec.version = Tormenta20::VERSION
  spec.authors = ["LuanGB"]
  spec.email = ["luan.goncbs@gmail.com"]

  spec.summary = "A Ruby, Node and Python library with data about the Brazilian TTRPG, Tormenta20"
  spec.description = "A Ruby, Node and Python library with data about the Brazilian TTRPG, Tormenta20"
  spec.homepage = "https://github.com/LuanGB/tormenta20"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/LuanGB/tormenta20"
  spec.metadata["changelog_uri"] = "https://github.com/LuanGB/tormenta20/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["src/ruby"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport", "~> 8.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
