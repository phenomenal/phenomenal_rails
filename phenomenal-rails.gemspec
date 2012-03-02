$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "phenomenal-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "phenomenal-rails"
  s.version     = PhenomenalRails::VERSION
  s.authors = "Loic Vigneron - Thibault Poncelet"
  s.email = "thibault.poncelet@student.uclouvain.be - loic.vigneron@student.uclouvain.be"
  s.homepage    = "http://www.phenomenal-gem.com"
  s.summary     = "Rails glue for phenomenal"
  s.description = "Rails integration of phenomenal"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.1"
  s.add_dependency "phenomenal"

  s.add_development_dependency "sqlite3"
end
