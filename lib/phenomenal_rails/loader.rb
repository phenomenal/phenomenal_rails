class PhenomenalRails::Loader
  def self.load_dir(path)
    if Dir.exist? path
      Dir.entries(path).each do |entry|
        if entry!="." && entry !=".."
          filepath=File.join(path,entry)
          if File.file?(filepath) && entry.match(/.*\.rb/)
            load filepath
          elsif File.directory?(filepath)
            load_dir(filepath)
          end
        end
      end
    end
  end
  
  def self.prepare(loading=false)
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
  
    if !Rails.configuration.cache_classes || loading
      PhenomenalRails::Loader.load_dir("#{Rails.root}/#{PhenomenalRails::PATH}")
    end
  end
end
