context :Firefox do
  
  adaptations_for ApplicationHelper
  
  adapt :test do
    "Adapted"
  end
end
