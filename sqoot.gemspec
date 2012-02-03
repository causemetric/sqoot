# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sqoot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julius F"]
  gem.email         = ["baldrailers@gmail.com"]
  gem.description   = %q{Wrapper for Sqoot API. Using FaradayMiddleware}
  gem.summary       = %q{Wrapper for Sqoot API}
  gem.homepage      = "https://github.com/causemetric/sqoot"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "sqoot"
  gem.require_paths = ["lib"]
  gem.version       = Sqoot::VERSION

  gem.add_runtime_dependency "faraday", "~> 0.7.5"
  gem.add_runtime_dependency "faraday_middleware", "~> 0.8.4"
  gem.add_runtime_dependency "hashie", "~> 1.2.0"
  gem.add_runtime_dependency "multi_json", "~> 1.0.4"

  gem.add_development_dependency "rspec", "~> 2.8.0"
  gem.add_development_dependency "fakeweb", "~> 1.3.0"
  gem.add_development_dependency "jnunemaker-matchy", "~> 0.4.0"
  gem.add_development_dependency "json_pure", "~> 1.6.5"
  gem.add_development_dependency "rake", "~> 0.9.2.2"
  gem.add_development_dependency "shoulda", "~> 2.11.3"
  gem.add_development_dependency "vcr", "~> 2.0.0.rc1"
  gem.add_development_dependency "simplecov", "~> 0.5.4"
  gem.add_development_dependency "simplecov-rcov", "~> 0.2.3"
end
