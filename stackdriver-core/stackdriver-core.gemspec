require File.expand_path("lib/stackdriver/core/version", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "stackdriver-core"
  gem.version       = Stackdriver::Core::VERSION

  gem.authors       = ["Daniel Azuma"]
  gem.email         = ["dazuma@google.com"]
  gem.description   = "stackdriver-core is an internal shared library for the Ruby Stackdriver integration libraries."
  gem.summary       = "Internal shared library for Ruby Stackdriver integration"
  gem.homepage      = "https://github.com/googleapis/google-cloud-ruby/tree/master/stackdriver-core"
  gem.license       = "Apache-2.0"

  gem.files         = `git ls-files -- lib/*`.split("\n") +
                      ["OVERVIEW.md", "CONTRIBUTING.md", "CHANGELOG.md", "CODE_OF_CONDUCT.md", "LICENSE", ".yardopts"]
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.5"

  gem.add_dependency "google-cloud-core", "~> 1.2"

  gem.add_development_dependency "autotest-suffix", "~> 1.1"
  gem.add_development_dependency "google-style", "~> 1.25.1"
  gem.add_development_dependency "minitest", "~> 5.14"
  gem.add_development_dependency "minitest-autotest", "~> 1.0"
  gem.add_development_dependency "minitest-focus", "~> 1.1"
  gem.add_development_dependency "minitest-rg", "~> 5.2"
  gem.add_development_dependency "redcarpet", "~> 3.0"
  gem.add_development_dependency "simplecov", "~> 0.9"
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "yard-doctest", "~> 0.1.13"
end
