require "phenomenal"
require "phenomenal-rails/context"
require "phenomenal-rails/middleware"
require "phenomenal-rails/engine"
require "phenomenal-rails/resolver"

# Set default context as persistent
phen_default_context.persistent=true

module PhenomenalRails
  def self.load_dir(path)
    if Dir.exist? path
      Dir.entries(path).each do |entry|
        if entry!="." && entry !=".." && entry.match(/(.*)\.rb/)
          filepath=File.join(path,entry)
          puts filepath
          if File.file?(filepath)
            load filepath 
          else
            load_dir(filepath)
          end
        end
      end
    end
  end
  
  ActionDispatch::Callbacks.before do
    phen_defined_contexts.reverse.each do |context|
      if !context.forgotten && (!context.persistent || !Rails.configuration.cache_classes)
        while phen_context_active?(context) do
          phen_deactivate_context(context) 
        end
        # Fix problem without page caching
        if !Rails.configuration.cache_classes
          phen_forget_context(context)
        end
      end
    end
    if !Rails.configuration.cache_classes
      PhenomenalRails.load_dir("#{Rails.root}/app/contexts") # TODO use a global 
    end
  end
end
