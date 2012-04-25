feature :PersistentFeature do
  context :TestContext do 
    adaptations_for ApplicationHelper
  
    adapt :test do 
      "Adapted helper"
    end
  end
end
