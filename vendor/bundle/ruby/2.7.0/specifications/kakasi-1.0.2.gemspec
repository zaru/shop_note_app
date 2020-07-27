# -*- encoding: utf-8 -*-
# stub: kakasi 1.0.2 ruby lib
# stub: ext/kakasi-config/extconf.rb

Gem::Specification.new do |s|
  s.name = "kakasi".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Akinori MUSHA".freeze]
  s.date = "2014-10-13"
  s.description = "A Ruby binding for KAKASI implemented with Fiddle/DL/FFI".freeze
  s.email = ["knu@idaemons.org".freeze]
  s.extensions = ["ext/kakasi-config/extconf.rb".freeze]
  s.files = ["ext/kakasi-config/extconf.rb".freeze]
  s.homepage = "https://github.com/knu/kakasi_ffi".freeze
  s.licenses = ["BSD".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A Ruby binding for KAKASI implemented with FFI".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rdoc>.freeze, ["> 2.4.2"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.2"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["> 2.4.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.2"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
