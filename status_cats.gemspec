# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "status_cats"
  s.version     = "0.0.1"
  s.authors     = ["iain"]
  s.email       = ["iain@iain.nl"]
  s.homepage    = "https://github.com/iain/status_cats"
  s.summary     = %q{Rack middleware; replaces responses with cats}
  s.description = %q{Rack middleware replacing responses with relevant pictures of cats, based on the status code.}

  s.rubyforge_project = "status_cats"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", ">= 2"
  s.add_development_dependency "rack-test"
  s.add_runtime_dependency "rack"
end
