# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigint_primary_key/version'

Gem::Specification.new do |gem|
  gem.name          = "bigint_primary_key"
  gem.version       = BigintPrimaryKey::VERSION
  gem.authors       = ["Ream Lim"]
  gem.email         = ["singachea@gmail.com"]
  gem.description   = %q{This is a simple gem to create big integer primary key for mysql and postgresql so that the auto increment is intact.}
  gem.summary       = %q{This is a simple gem to create big integer primary key for mysql and postgresql so that the auto increment is intact.}
  gem.homepage      = "http://github.com/singachea"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
