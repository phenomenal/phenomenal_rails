class PhenomenalRails::Middleware
  def initialize(app)
    @app=app
    @activation_conditions=Array.new
    Phenomenal::Feature.middleware=self
  end

  def add_condition(feature,&block)
    @activation_conditions.push([feature,block])
  end
<<<<<<< HEAD

  def sort_activation_conditions
   @activation_conditions.sort!{|a,b| puts a}
  end

=======
  
  def clear_activition_conditions
    @activation_conditions.clear
  end
  
>>>>>>> c5a2eb88e0d661c6f3acd429542e84f8e6b6365c
  def call(env)
    before_call(env)
    @app.call(env)
  end

  def before_call(env)
    @activation_conditions.each do |feature_block|
      feature,block = feature_block
      if feature.active?
        block.call(env)
      end
    end
  end
end
