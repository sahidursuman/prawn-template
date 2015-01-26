# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prawn/template/version'

Gem::Specification.new do |spec|
  spec.name          = "prawn-template"
  spec.version       = Prawn::Template::VERSION
  spec.authors       = ["Ole Johnny Rosendahl"]
  spec.email         = ["ole.johnny.rosendahl@gmail.com"]
  spec.summary       = %q{Ready to use PDF-templates}
  spec.description   = %q{Prawn-PDF templates for rapid PDF-generation}
  spec.homepage      = "http://olejrosendahl.github.io/prawn-template"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prawn", ">= 1.3.0", "< 3.0.0"
  spec.add_dependency "prawn-table", "0.2.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.1.0"
end
