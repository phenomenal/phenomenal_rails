# Add persistent attribute to the context class, allowing to disable 
# auto deactivation between HTTP requests
class Phenomenal::Context
  attr_accessor :persistent
  #DSL inside context definition
  def is_persistent
    @persistent  = true
    activate
  end
  
  def to_path
    if name
      name.to_s.underscore
    elsif self==manager.default_feature
      nil
    elsif manager.combined_contexts[self]
       manager.combined_contexts[self].flatten.join("/").underscore
    else
      nil
    end
  end
end
