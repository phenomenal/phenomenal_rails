module PhenomenalRails
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
    config.after_initialize do
      ActionController::Base.prepend_view_path(Phenomenal::Resolver.instance)
    end
  end
end



