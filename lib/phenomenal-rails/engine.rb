module PhenomenalRails
  class Engine < Rails::Engine
    #isolate_namespace PhenomenalRails #TODO check if needed
    config.app_middleware.use(PhenomenalRails::Middleware)
  end
end
