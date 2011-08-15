# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{filters_spam}
  s.version = "0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Philip Arndt", "David Jones"]
  s.date = %q{2010-09-13}
  s.description = %q{This is a small Ruby on Rails plugin that can be installed as a gem in your Gemfile that allows models to attach to it to provide spam filtering functionality.}
  s.email = %q{info@resolvedigital.co.nz}
  s.files = ["readme.md", "lib/filters_spam.rb"]
  s.homepage = %q{http://www.resolvedigital.co.nz}
  s.require_paths = ["lib"]
  s.requirements = ["none"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Attach to your model to have this filter out the spam using scoring techniques.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
