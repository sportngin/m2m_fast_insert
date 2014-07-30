# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "m2m_fast_insert/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "m2m_fast_insert"
  s.version     = M2MFastInsert::VERSION
  s.authors     = ["Jon Phenow"]
  s.email       = ["jon.phenow@tstmedia.com"]
  s.homepage    = ""
  s.summary     = %q{Fast Inserts for Rails Many to Many relations}
  s.description = %q{}
  s.license     = "MIT"

  s.rubyforge_project = "m2m_fast_insert"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", [">= 3.0.0", "< 4.0.0"]
  s.add_runtime_dependency('activerecord', [">= 3.0.0", "< 4.2.0"])
  s.add_runtime_dependency('activesupport', [">= 3.0.0", "< 4.2.0"])

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
