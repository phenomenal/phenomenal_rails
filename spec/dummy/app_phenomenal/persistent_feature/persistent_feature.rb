feature :PersistentFeature do
  is_persistent
  priority=1
  activation_condition do |env|
    if Rack::Request.new(env).params["activated"]
      activate_context :TestContext
      activate_context :TestFeature
    else
      deactivate_context :TestContext
      deactivate_context :TestFeature
    end
  end
end
