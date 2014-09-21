# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ip2address/version'

Gem::Specification.new do |spec|
  spec.name          = "ip2address"
  spec.version       = Ip2address::VERSION
  spec.authors       = ["gxw"]
  spec.email         = ["alphaguoxiongwei@gmail.com"]
  spec.summary       = %q{ip -> address.}
  spec.description   = %q{ip -> address.}
  spec.homepage      = "https://github.com/littleluren/ip2address"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.1.0"
  spec.add_development_dependency "webmock", "~> 1.18.0"
  spec.add_development_dependency "rspec-do_action", "~> 0.0.4"
  spec.add_development_dependency "faraday", "~> 0.9.0"
  spec.add_development_dependency "faraday_middleware", "~> 0.9.1"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "pry"
end
