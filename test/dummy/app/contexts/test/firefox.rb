class Test::Firefox
  act_as_context
  
  adaptations_for ApplicationHelper
  
  adapt :test do
    "Adapted"
  end
end
