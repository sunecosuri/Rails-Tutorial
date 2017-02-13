# -*- encoding: utf-8 -*-
# stub: web-console 2.0.0.beta3 ruby lib

Gem::Specification.new do |s|
  s.name = "web-console".freeze
  s.version = "2.0.0.beta3"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Charlie Somerville".freeze, "Genadi Samokovarov".freeze, "Guillermo Iguaran".freeze, "Ryan Dao".freeze]
  s.date = "2014-08-21"
  s.email = ["gsamokovarov@gmail.com".freeze, "guilleiguaran@gmail.com".freeze, "daoduyducduong@gmail.com".freeze]
  s.homepage = "https://github.com/rails/web-console".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Rails Console on the Browser.".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, ["~> 4.0"])
      s.add_runtime_dependency(%q<activemodel>.freeze, ["~> 4.0"])
      s.add_runtime_dependency(%q<sprockets-rails>.freeze, ["< 4.0", ">= 2.0"])
      s.add_runtime_dependency(%q<binding_of_caller>.freeze, ["= 0.7.3.pre1"])
      s.add_development_dependency(%q<actionmailer>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<activerecord>.freeze, ["~> 4.0"])
    else
      s.add_dependency(%q<railties>.freeze, ["~> 4.0"])
      s.add_dependency(%q<activemodel>.freeze, ["~> 4.0"])
      s.add_dependency(%q<sprockets-rails>.freeze, ["< 4.0", ">= 2.0"])
      s.add_dependency(%q<binding_of_caller>.freeze, ["= 0.7.3.pre1"])
      s.add_dependency(%q<actionmailer>.freeze, ["~> 4.0"])
      s.add_dependency(%q<activerecord>.freeze, ["~> 4.0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, ["~> 4.0"])
    s.add_dependency(%q<activemodel>.freeze, ["~> 4.0"])
    s.add_dependency(%q<sprockets-rails>.freeze, ["< 4.0", ">= 2.0"])
    s.add_dependency(%q<binding_of_caller>.freeze, ["= 0.7.3.pre1"])
    s.add_dependency(%q<actionmailer>.freeze, ["~> 4.0"])
    s.add_dependency(%q<activerecord>.freeze, ["~> 4.0"])
  end
end
