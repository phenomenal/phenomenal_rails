module PhenomenalRails
  PATH = "app/phenomenal"
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
    config.after_initialize do
      ActionController::Base.prepend_view_path(PhenomenalRails::Resolver.instance)
    end
    config.to_prepare do
      PhenomenalRails.load_dir("#{Rails.root}/#{PATH}")
    end
  end
end



