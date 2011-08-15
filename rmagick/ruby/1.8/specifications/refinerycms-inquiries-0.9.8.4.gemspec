# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{refinerycms-inquiries}
  s.version = "0.9.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Resolve Digital"]
  s.date = %q{2010-08-30}
  s.description = %q{Inquiry handling functionality extracted from Refinery CMS to allow you to have a contact form and manage inquiries in the Refinery backend.}
  s.email = %q{info@refinerycms.com}
  s.files = ["app/controllers/admin/inquiries_controller.rb", "app/controllers/admin/inquiry_settings_controller.rb", "app/controllers/inquiries_controller.rb", "app/helpers/inquiries_helper.rb", "app/mailers/inquiry_mailer.rb", "app/models/inquiry.rb", "app/models/inquiry_setting.rb", "app/views/admin/inquiries/_inquiry.html.erb", "app/views/admin/inquiries/_submenu.html.erb", "app/views/admin/inquiries/index.html.erb", "app/views/admin/inquiries/show.html.erb", "app/views/admin/inquiries/spam.html.erb", "app/views/admin/inquiry_settings/_confirmation_email_form.html.erb", "app/views/admin/inquiry_settings/_notification_recipients_form.html.erb", "app/views/admin/inquiry_settings/edit.html.erb", "app/views/inquiries/new.html.erb", "app/views/inquiries/thank_you.html.erb", "app/views/inquiry_mailer/confirmation.html.erb", "app/views/inquiry_mailer/notification.html.erb", "config/locales/da.yml", "config/locales/de.yml", "config/locales/en.yml", "config/locales/es.yml", "config/locales/fr.yml", "config/locales/it.yml", "config/locales/lv.yml", "config/locales/nb.yml", "config/locales/nl.yml", "config/locales/pt-BR.yml", "config/locales/ru.yml", "config/locales/sl.yml", "config/locales/zh-CN.yml", "config/routes.rb", "readme.md", "license.md", "lib/inquiries.rb"]
  s.homepage = %q{http://refinerycms.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Inquiry handling functionality for the Refinery CMS project.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<filters_spam>, ["~> 0.1"])
    else
      s.add_dependency(%q<filters_spam>, ["~> 0.1"])
    end
  else
    s.add_dependency(%q<filters_spam>, ["~> 0.1"])
  end
end
