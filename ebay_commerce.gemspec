# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebay_commerce/version'

Gem::Specification.new do |spec|
  spec.name          = "ebay-commerce"
  spec.version       = EbayCommerce::VERSION
  spec.authors       = ["João Barbosa"]
  spec.email         = ["j.barbosa333@gmail.com"]
  spec.summary       = %q{Ruby on Rails wrapper gem for EbayCommerce API}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'  # Due to HTTParty
  spec.add_dependency 'httparty', '~> 0.12'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency 'webmock', '1.15.2'
  spec.add_development_dependency 'vcr',     '~> 2.8'
end
