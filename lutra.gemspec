# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "lutra/version"

Gem::Specification.new do |s|
  s.name = "lutra"
  s.version = Lutra::VERSION
  s.authors = ["Yuri Artemev"]
  s.email = ["i@artemeff.com"]
  s.homepage = "http://github.com/artemeff/lutra"
  s.summary = %q{In source annotaions parser}
  s.description = %q{Parse tags (todo, fixme, optimize) in your source code}

  s.files = %w(README.md LICENSE lutra.gemspec)
  s.files += Dir.glob("lib/**/*.rb")
  s.files += Dir.glob("spec/**/*")
  s.licenses = ['MIT']
  s.require_paths = ['lib']
  s.test_files = Dir.glob("spec/**/*")

  spec.executables << 'notes'
end
