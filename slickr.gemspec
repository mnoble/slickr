# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slickr/version'

Gem::Specification.new do |spec|
  spec.name          = "slickr"
  spec.version       = Slickr::VERSION
  spec.authors       = ["Matte Noble"]
  spec.email         = ["me@mattenoble.com"]
  spec.description   = %q{Slick2D JRuby project generator}
  spec.summary       = %q{Slick2D JRuby project generator}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "i18n"
  spec.add_dependency "active_support"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakefs"
end
