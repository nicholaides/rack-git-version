# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack-git-version/version"

Gem::Specification.new do |s|
  s.name        = "rack-git-version"
  s.version     = Rack::GitVersion::VERSION
  s.authors     = ["Mike Nicholaides"]
  s.email       = ["mike@ablegray.com"]
  s.homepage    = "https://github.com/nicholaides/rack-git-version"
  s.summary     = %q{Adds your git ref to the HTTP headers}
  s.description = %q{Adds your git ref to the HTTP headers}

  s.rubyforge_project = "rack-git-version"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack-test"
end
