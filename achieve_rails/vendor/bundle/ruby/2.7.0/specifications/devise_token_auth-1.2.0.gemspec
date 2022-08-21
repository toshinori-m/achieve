# -*- encoding: utf-8 -*-
# stub: devise_token_auth 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_token_auth".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lynn Hurley".freeze]
  s.date = "2021-07-19"
  s.description = "For use with client side single page apps such as the venerable https://github.com/lynndylanhurley/ng-token-auth.".freeze
  s.email = ["lynn.dylan.hurley@gmail.com".freeze]
  s.homepage = "http://github.com/lynndylanhurley/devise_token_auth".freeze
  s.licenses = ["WTFPL".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Token based authentication for rails. Uses Devise + OmniAuth.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.2.0", "< 6.2"])
    s.add_runtime_dependency(%q<devise>.freeze, ["> 3.5.2", "< 5"])
    s.add_runtime_dependency(%q<bcrypt>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_development_dependency(%q<mongoid>.freeze, [">= 4", "< 8"])
    s.add_development_dependency(%q<mongoid-locker>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.2.0", "< 6.2"])
    s.add_dependency(%q<devise>.freeze, ["> 3.5.2", "< 5"])
    s.add_dependency(%q<bcrypt>.freeze, ["~> 3.0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_dependency(%q<mongoid>.freeze, [">= 4", "< 8"])
    s.add_dependency(%q<mongoid-locker>.freeze, ["~> 1.0"])
  end
end
