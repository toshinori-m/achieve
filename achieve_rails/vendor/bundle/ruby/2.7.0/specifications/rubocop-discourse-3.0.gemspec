# -*- encoding: utf-8 -*-
# stub: rubocop-discourse 3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-discourse".freeze
  s.version = "3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Discourse Team".freeze]
  s.date = "2022-09-26"
  s.homepage = "https://github.com/discourse/rubocop-discourse".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Custom rubocop cops used by Discourse".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.1.0"])
    s.add_runtime_dependency(%q<rubocop-rspec>.freeze, [">= 2.0.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rubocop>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
