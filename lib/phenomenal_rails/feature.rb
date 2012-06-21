class Phenomenal::Feature 
  def self.middleware=(middleware)
    @@middleware=middleware
  end
  
  def self.middleware
    @@middleware
  end
  
  def activation_condition(&block)
    Phenomenal::Feature.middleware.add_condition(self,&block)
    nil
  end
end
