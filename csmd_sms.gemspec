# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csmd_sms/version'

Gem::Specification.new do |spec|
  spec.name          = "csmd_sms"
  spec.version       = CsmdSms::VERSION
  spec.authors       = ["jimmy.huangjin"]
  spec.email         = ["jimmy.huangjin@gmail.com"]
  spec.description   = %q{创世漫道的短信通道服务}
  spec.summary       = %q{创世漫道的短信通道服务}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
