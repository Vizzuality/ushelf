Refinery::Application.routes.draw do

  filter(:refinery_locales) if defined?(RoutingFilter::RefineryLocales) # optionally use i18n.

  root :to => 'pages#home'
  match 'sitemap', :to => 'pages#sitemap'

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    root :to => 'dashboard#index'
  end

end
