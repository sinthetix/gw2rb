# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gw2/version'

Gem::Specification.new do |spec|
  spec.name          = 'gw2rb'
  spec.version       = GW2::VERSION
  spec.authors       = ['Aly Fulton']
  spec.email         = ['thix@obeythelime.com']

  spec.summary       = %q{A Ruby wrapper for the GW2 v2 API}
  spec.homepage      = 'https://github.com/sinthetix/gw2rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.3'

  spec.add_dependency('faraday', '~> 0.10.0')
end
