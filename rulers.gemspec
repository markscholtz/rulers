# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |gem|
  gem.name          = "rulers"
  gem.version       = Rulers::VERSION
  gem.authors       = ["Mark Scholtz"]
  gem.email         = ["markscholtz@gmail.com"]
  gem.description   = %q{Rebuilding Rails}
  gem.summary       = %q{Rebuilding Rails to better learn the internals of Rails}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "erubis"
  gem.add_runtime_dependency "rack"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "pry"
end
