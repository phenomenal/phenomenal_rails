class PhenomenalRails::Engine < Rails::Engine
  isolate_namespace PhenomenalRails
  config.app_middleware.use(PhenomenalRails::Middleware)
  
  config.before_configuration do
    Rails.configuration.autoload_paths += PhenomenalRails::Loader.autoload_paths(File.expand_path(PhenomenalRails::PATH,Rails.root))
  end
  
  config.to_prepare do
    PhenomenalRails::Loader.prepare(true)
  end
  
  config.after_initialize do
    ActionController::Base.prepend_view_path(PhenomenalRails::Resolver.instance)
  end
  
  ActionDispatch::Callbacks.before do |*args|
    PhenomenalRails::Loader.prepare
  end
end