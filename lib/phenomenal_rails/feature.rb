class Phenomenal::Feature 
  def self.middleware=(middleware)
    @@middleware=middleware
  end
  
  def activation_condition(&block)
    @@middleware.add_condition(self,&block)
    nil
  end
end
