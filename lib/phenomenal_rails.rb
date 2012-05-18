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

module PhenomenalRails end
