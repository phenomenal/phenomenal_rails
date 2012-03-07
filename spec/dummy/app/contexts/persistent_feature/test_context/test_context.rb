feature :PersistentFeature do
  context :TestContext do 
    adaptations_for ApplicationHelper
  
    adapt :test do 
      "adapted helper"
    end
  end
end