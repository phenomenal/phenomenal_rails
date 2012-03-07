feature :PersistentFeature do
  is_persistent
  adaptations_for PhenomenalRails::Middleware
  adapt_class :activation_handler do |env|
    if Rack::Request.new(env).params["activated"]
      activate_context :TestContext
    else
      deactivate_context :TestContext
    end
  end

end
