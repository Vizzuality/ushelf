# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{truncate_html}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Harold A. Gimenez"]
  s.date = %q{2010-03-30}
  s.description = %q{Truncates html so you don't have to}
  s.email = %q{harold.gimenez@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.markdown"]
  s.files = [".gitignore", "Gemfile", "History.txt", "LICENSE", "README.markdown", "Rakefile", "VERSION", "init.rb", "lib/app/helpers/truncate_html_helper.rb", "lib/truncate_html.rb", "lib/truncate_html/configuration.rb", "lib/truncate_html/html_string.rb", "lib/truncate_html/html_truncator.rb", "spec/helpers/truncate_html_helper_spec.rb", "spec/rails_root/.bundle/config", "spec/rails_root/Gemfile", "spec/rails_root/app/controllers/application_controller.rb", "spec/rails_root/app/helpers/application_helper.rb", "spec/rails_root/config/application.rb", "spec/rails_root/config/boot.rb", "spec/rails_root/config/database.yml", "spec/rails_root/config/environment.rb", "spec/rails_root/config/environments/development.rb", "spec/rails_root/config/environments/production.rb", "spec/rails_root/config/environments/test.rb", "spec/rails_root/config/initializers/backtrace_silencers.rb", "spec/rails_root/config/initializers/inflections.rb", "spec/rails_root/config/initializers/mime_types.rb", "spec/rails_root/config/initializers/new_rails_defaults.rb", "spec/rails_root/config/initializers/session_store.rb", "spec/rails_root/config/locales/en.yml", "spec/rails_root/config/routes.rb", "spec/rails_root/init.rb", "spec/rails_root/lib/app/helpers/truncate_html_helper.rb", "spec/rails_root/lib/tasks/rspec.rake", "spec/spec.opts", "spec/spec_helper.rb", "spec/truncate_html/configuration_spec.rb", "spec/truncate_html/html_string_spec.rb", "spec/truncate_html/html_truncator_spec.rb", "truncate_html.gemspec"]
  s.homepage = %q{http://github.com/hgimenez/truncate_html}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Uses an API similar to Rails' truncate helper to truncate HTML and close any lingering open tags.}
  s.test_files = ["spec/helpers/truncate_html_helper_spec.rb", "spec/rails_root/app/controllers/application_controller.rb", "spec/rails_root/app/helpers/application_helper.rb", "spec/rails_root/config/application.rb", "spec/rails_root/config/boot.rb", "spec/rails_root/config/environment.rb", "spec/rails_root/config/environments/development.rb", "spec/rails_root/config/environments/production.rb", "spec/rails_root/config/environments/test.rb", "spec/rails_root/config/initializers/backtrace_silencers.rb", "spec/rails_root/config/initializers/inflections.rb", "spec/rails_root/config/initializers/mime_types.rb", "spec/rails_root/config/initializers/new_rails_defaults.rb", "spec/rails_root/config/initializers/session_store.rb", "spec/rails_root/config/routes.rb", "spec/rails_root/init.rb", "spec/rails_root/lib/app/helpers/truncate_html_helper.rb", "spec/spec_helper.rb", "spec/truncate_html/configuration_spec.rb", "spec/truncate_html/html_string_spec.rb", "spec/truncate_html/html_truncator_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
