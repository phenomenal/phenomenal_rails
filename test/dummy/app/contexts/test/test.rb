feature :Test do
  
  adaptations_for PhenomenalRails::Middleware
  
  adapt :activation_handler do |env|
    pnml_activate_context(:Firefox) 
  end
  
  puts "-------------------------------------=^_^=---------------------------"
  pnml_activate_context(:Test)
  
end
