$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erb_minifier/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erb_minifier"
  s.version     = ErbMinifier::VERSION
  s.authors     = ["jasl"]
  s.email       = ["jasl9187@hotmail.com"]
  s.homepage    = "http://blog.jasl.me"
  s.summary     = "erb_minifier helps you minify erb templates to reduce transfer time."
  s.description = "execute \"rake views:precompile\" before start server on production enveronment."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"

  s.add_development_dependency "sqlite3"
end
