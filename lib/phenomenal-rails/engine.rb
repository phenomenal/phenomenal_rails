module PhenomenalRails
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
  end
end
