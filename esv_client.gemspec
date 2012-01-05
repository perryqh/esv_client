# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "esv_client/version"

Gem::Specification.new do |s|
  s.name        = "esv_client"
  s.version     = EsvClient::VERSION
  s.authors     = ["Perry Hertler"]
  s.email       = ["perry@hertler.org"]
  s.homepage    = ""
  s.summary     = %q{Client for esvapi.org}
  s.description = %q{}

  s.rubyforge_project = "esv_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency  "rake"
  s.add_development_dependency  "rspec"
  s.add_development_dependency  "cucumber"
  s.add_development_dependency  "nokogiri"
  s.add_development_dependency  "guard-rspec"
  s.add_development_dependency  "vcr"
  s.add_development_dependency  "fakeweb"
  s.add_development_dependency  "pry"

  s.add_runtime_dependency "rest-client"
end
