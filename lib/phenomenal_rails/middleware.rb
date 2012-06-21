class PhenomenalRails::Middleware
  def initialize(app)
    @app=app
    @activation_conditions=Array.new
    Phenomenal::Feature.middleware=self
  end

  def add_condition(feature,&block)
    puts "pppp"
    @activation_conditions.push([feature,block])
    sort_activation_conditions
    puts @activation_conditions
  end

  def clear_activition_conditions
    @activation_conditions.clear
  end

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

  private
  def sort_activation_conditions
    @activation_conditions= @activation_conditions.sort do |a,b|
      Phenomenal::Manager.instance.conflict_policy(b[0],a[0])
    end
  end
end
