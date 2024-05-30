# frozen_string_literal: true

require_relative "lib/call_rails/version"

Gem::Specification.new do |spec|
  spec.name = "call_rails"
  spec.version = CallRails::Version
  spec.authors = ["Amrinder Singh"]
  spec.email = ["amsingh@beesolvertechnology.com"]

  spec.summary = "Ruby Gem For Call Rails Integration"
  spec.description = "Ruby Gem For Call Rails Integration"
  spec.homepage = "https://github.com/customerlobby/call_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.3.0"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/customerlobby"
    spec.metadata["homepage_uri"]      = spec.homepage
    spec.metadata["source_code_uri"]   = spec.homepage
    spec.metadata["changelog_uri"]     = "#{spec.homepage}/blob/master/CHANGELOG.md"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
            'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'byebug'

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'hashie'
end
