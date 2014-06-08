# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dugger/version'

Gem::Specification.new do |spec|
  spec.name          = "dugger"
  spec.version       = Dugger::VERSION
  spec.authors       = ["Seva Polyakov"]
  spec.email         = ["ctrlok@gmail.com"]
  spec.description   = "Little gem to easy chef team management"
  spec.summary       = "Little gem to easy chef team management"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chef"
  spec.add_dependency "ridley"
  spec.add_dependency "versionomy"
  spec.add_dependency "thor"
  spec.add_dependency "git"
  spec.add_dependency "rugged"
  spec.add_dependency "formatador"
  spec.add_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
