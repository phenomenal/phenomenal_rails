feature :Test do
  
  adaptations_for PhenomenalRails::Middleware
  
  adapt :activation_handler do |env|
    activate_context(:Firefox) 
  end
  
  phen_activate_context(:Test)
  
end
