feature :Test do
  context :Firefox do
    persistent
    adaptations_for ApplicationHelper
    
    adapt :test do
      "Adapted"
    end
  end
end
