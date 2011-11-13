require "phenomenal"
require "phenomenal-rails/middleware"
require "phenomenal-rails/engine"

module PhenomenalRails
  def self.load_dir(path)
    if Dir.exist? path
      Dir.entries(path).each do |entry|
        if entry!="." && entry !=".."
          filepath=File.join(path,entry)
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
    pnml_defined_contexts.reverse.each do |context| # TODO reverse because default has to be last forgeted
      if !context.persistent || !Rails.configuration.cache_classes
        while pnml_context_active?(context) do
          pnml_deactivate_context(context) 
        end
        # Fix problem without page caching
        if !Rails.configuration.cache_classes
          pnml_forget_context(context)
        end
      end
      
    end
    if !Rails.configuration.cache_classes
      PhenomenalRails.load_dir("#{Rails.root}/app/contexts")
    end
  end
end
