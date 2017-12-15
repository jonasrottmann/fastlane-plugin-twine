lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/twine/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-twine'
  spec.version       = Fastlane::Twine::VERSION
  spec.author        = 'Jonas Rottmann'
  spec.email         = 'jonasrottmann@gmail.com'

  spec.summary       = 'A fastlane plugin providing actions related to twine'
  spec.homepage      = 'https://github.com/jonasrottmann/fastlane-plugin-twine'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'diffy'
  spec.add_dependency 'json'
  spec.add_dependency 'json-schema'
  spec.add_dependency 'twine'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'fastlane', '>= 2.26.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '0.49.1'
end
