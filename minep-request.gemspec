# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minep-request/version'

Gem::Specification.new do |gem|
  gem.name          = "minep-request"
  gem.version       = Minep::Request::VERSION
  gem.date          = Minep::Request::DATE
  gem.authors       = ["Matthieu \"Ezveus\" Ciappara"]
  gem.email         = ["ciappam@gmail.com"]
  gem.description   = <<-EOS
Binary allowing the communication with a MINE server. It support both MINE Protocol over TCP and over WebSocket.
EOS
  gem.summary       = %q{Binary allowing the communication with a MINE server}
  gem.homepage      = "https://github.com/Ezveus/minep-request"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
