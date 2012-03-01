module PhenomenalRails
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
    config.after_initialize do
      ActionController::Base.view_paths.paths.insert(0,Phenomenal::Resolver.new("app/contexts"))
    end
  end
end



