# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-googlefederated/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-googlefederated"
  s.version     = Omniauth::Googlefederated::VERSION
  s.authors     = ["Henry Liu"]
  s.email       = ["henry@liuhenry.com"]
  s.homepage    = ""
  s.summary     = %q{Google OAuth/OpenID Federated Login strategy for OmniAuth 1.0}
  s.description = %q{Hybrid authentication and authorization strategy for Google APIs. Combines the process for obtaining an authorized OAuth request token along with an OpenID authentication request.}

  s.rubyforge_project = "omniauth-googlefederated"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth"
  s.add_runtime_dependency "ruby-openid"
  s.add_runtime_dependency "omniauth-openid"

end
