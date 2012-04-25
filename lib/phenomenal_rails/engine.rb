module PhenomenalRails
  PATH = "app_phenomenal"
  class Engine < Rails::Engine
    isolate_namespace PhenomenalRails
    config.app_middleware.use(PhenomenalRails::Middleware)
    config.after_initialize do
      ActionController::Base.prepend_view_path(PhenomenalRails::Resolver.instance)
    end
    ActionDispatch::Callbacks.before do |*args|
      PhenomenalRails.prepare
    end
    config.to_prepare do
      PhenomenalRails.prepare(true)
    end
  end
end
