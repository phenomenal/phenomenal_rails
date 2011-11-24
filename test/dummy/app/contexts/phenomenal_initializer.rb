class PhenomenalInitializer
  
  def self.init
    # Define conflict resolution policy
    phen_change_conflict_policy { |a,b| age_conflict_policy(a,b) }  
  end
end
