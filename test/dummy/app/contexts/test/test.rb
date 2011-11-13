class Test::Test
  act_as_context :persistent
  
  adaptations_for PhenomenalRails::Middleware
  
  adapt :activation_handler do |env|
    user_agent = env["HTTP_USER_AGENT"]
    if user_agent[/(Firefox)/]
      pnml_activate_context("Test::Firefox") 
    end
    pnml_proceed(env)
  end
  
  pnml_activate_context(self.name)
end
