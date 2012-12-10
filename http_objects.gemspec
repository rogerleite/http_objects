# -*- encoding: utf-8 -*-
require File.expand_path('../lib/http_objects/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Roger Leite"]
  gem.email         = ["roger.barreto@gmail.com"]
  gem.description   = %q{HTTP 1.1 by the spec, specially headers}
  gem.summary       = %q{HTTP 1.1 by the spec, specially headers}
  gem.homepage      = "https://github.com/rogerleite/http_objects"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "http_objects"
  gem.require_paths = ["lib"]
  gem.version       = HttpObjects::VERSION
end
