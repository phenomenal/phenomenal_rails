feature :PersistentFeature do
  is_persistent
  activation_condition do |env|
    if Rack::Request.new(env).params["activated"]
      activate_context :TestContext
    else
      deactivate_context :TestContext
    end
  end
end
