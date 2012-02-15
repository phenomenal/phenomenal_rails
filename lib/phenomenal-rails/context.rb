# Add persistent attribute to the context class, allowing to disable 
# auto deactivation between HTTP requests
class Phenomenal::Context
  attr_accessor :persistent
  #DSL inside context definition
  def is_persistent
    @persistent  = true
    activate
  end
end
