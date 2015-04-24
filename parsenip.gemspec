# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parsenip/version'

Gem::Specification.new do |spec|
  spec.name          = "parsenip"
  spec.version       = Parsenip::VERSION
  spec.authors       = ["Bruno Gabrielli"]
  spec.email         = ["bpgabrielli@gmail.com"]
  spec.summary       = %q{Grab the good stuff from recipe pages}
  spec.description   = %q{Takes a recipe URL and returns a hash of neatly nested components, or just the parts you ask for.}
  spec.homepage      = "https://github.com/bpgabrielli/parsenip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'

  spec.add_dependency "nokogiri"
end
