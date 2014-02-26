module PhenomenalRails
  # Phenomenal application folder
  PATH = "app_phenomenal"
end

require "phenomenal"
require "phenomenal_rails/loader"
require "phenomenal_rails/context"
require "phenomenal_rails/feature"
require "phenomenal_rails/middleware"
require "phenomenal_rails/engine"
require "singleton"
require "phenomenal_rails/resolver"
require "phenomenal_rails/path_set"

# Set default feature as persistent
phen_default_feature.persistent=true
phen_change_conflict_policy { |a,b| priority_conflict_policy(a,b) }