# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formtastic_autocomplete/version'

Gem::Specification.new do |spec|
  spec.name          = 'formtastic_autocomplete'
  spec.version       = FormtasticAutocomplete::VERSION
  spec.authors       = ['Matt Huggins']
  spec.email         = ['matt.huggins@gmail.com']
  spec.description   = %q{jQuery autocomplete for Formtastic form fields}
  spec.summary       = %q{jQuery autocomplete for Formtastic form fields}
  spec.homepage      = 'https://github.com/mhuggins/formtastic_autocomplete'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'formtastic'

  spec.add_development_dependency 'actionpack'
  spec.add_development_dependency 'activemodel'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec'
end
