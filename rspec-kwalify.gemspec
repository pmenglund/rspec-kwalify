# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspec-kwalify/version"

Gem::Specification.new do |s|
  s.name        = "rspec-kwalify"
  s.version     = RSpec::Kwalify::VERSION
  s.authors     = ["Martin Englund"]
  s.email       = ["martin@englund.nu"]
  s.homepage    = ""
  s.summary     = %q{rspec matchers for kwalify}
  s.description = %q{rspec matchers for kwalify}

  s.rubyforge_project = "rspec-kwalify"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "kwalify"
end
