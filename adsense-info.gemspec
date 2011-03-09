# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adsense-info/version"

Gem::Specification.new do |s|
  s.name        = "adsense-info"
  s.version     = Adsense::Info::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Clive Crous"]
  s.email       = ["clive@crous.co.za"]
  s.homepage    = "http://www.darkarts.co.za/adsense-info"
  s.summary     = %q{Retrieve adsense income totals}
  s.description = %q{Retrieve income from your adsense account}

  s.add_dependency "mechanize"
  s.add_dependency "hpricot"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake", ">= 0.8.7"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
