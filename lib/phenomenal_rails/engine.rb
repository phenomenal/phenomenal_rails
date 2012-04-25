module PhenomenalRails
  PATH = "app_phenomenal"
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
    config.after_initialize do
      ActionController::Base.prepend_view_path(PhenomenalRails::Resolver.instance)
    end
    ActionDispatch::Callbacks.before do |*args|
      PhenomenalRails::Loader.prepare
    end
    config.to_prepare do
      PhenomenalRails::Loader.prepare(true)
    end
  end
end
