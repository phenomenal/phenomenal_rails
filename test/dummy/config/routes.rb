Rails.application.routes.draw do

  mount PhenomenalRails::Engine => "/phenomenal-rails"
  root :to=> "Application#home"
end
