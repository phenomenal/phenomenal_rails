class PhenomenalRails::ContextDefinition
  def self.context(*args,&block)
    puts "OYAAUUUII"
    Phenomenal::Context.create(*args,&block)
  end
  def self.feature(*args,&block)
     Phenomenal::Context.create_feature(*args,&block)
  end
end
