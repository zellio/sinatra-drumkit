# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/drumkit/version'

Gem::Specification.new do |spec|
  spec.name = 'sinatra-drumkit'
  spec.version = Sinatra::Drumkit::VERSION
  spec.authors = ['Zachary Elliott']
  spec.email = ['contact@zell.io']

  spec.summary = 'Provide clean MVC autoloading for sinatra'
  spec.description = "Provide autoloading of Model classes and Controller for
  sinatra to allow for simpler writing of MVC web applications."

  spec.homepage = 'https://github.com/zellio/sinatra-drumkit'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'sinatra', '~> 1.4'
end
