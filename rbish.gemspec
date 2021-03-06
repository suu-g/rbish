# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbish/version'

Gem::Specification.new do |spec|
  spec.name          = "rbish"
  spec.version       = Rbish::VERSION
  spec.authors       = ["suu-g"]
  spec.email         = ["suu-g@kata.me"]
  spec.summary       = %q{An erb-shellscript executor}
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/suu-g/rbish"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "tilt"
  spec.add_dependency "mixlib-cli"
  spec.add_dependency "mixlib-config"
  spec.add_dependency "mixlib-log"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
