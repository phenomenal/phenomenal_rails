feature :Test do
  #is_persistent
  
  adaptations_for PhenomenalRails::Middleware
  
  adapt_class :activation_handler do |env|
    activate_context(:Firefox) 
  end
end
