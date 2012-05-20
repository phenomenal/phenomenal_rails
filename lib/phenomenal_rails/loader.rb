class PhenomenalRails::Loader
  class << self
    def autoload_paths(path,paths=[])
      self.scan_dir(path) do |filepath, entry|
        if File.directory?(filepath)
          if (filepath.match(/.*\/controllers/) ||
            filepath.match(/.*\/models/) ||
            filepath.match(/.*\/helpers/))      
            paths.push(filepath)
          end
          autoload_paths(filepath,paths)        
        end
      end
      paths
    end
    
    def scan_dir(path, &block)
      if Dir.exist? path
        Dir.entries(path).each do |entry|
          if entry!="." && entry !=".."
            filepath=File.join(path,entry)
            yield(filepath, entry)
          end
        end
      end
    end
   
    def load_files(path)
      self.scan_dir(path) do |filepath, entry|
        if File.file?(filepath) && entry.match(/.*\.rb/)
          load filepath
        elsif File.directory?(filepath)
          if !(filepath.match(/.*\/controllers/) ||
            filepath.match(/.*\/models/) ||
            filepath.match(/.*\/helpers/))
            load_files(filepath)
          end
        end
      end
    end
    
    def prepare(loading=false)
      phen_defined_contexts.reverse.each do |context|
        if !context.forgotten && (!context.persistent || !Rails.configuration.cache_classes)
          while phen_context_active?(context) do
            phen_deactivate_context(context) 
          end
          if !Rails.configuration.cache_classes
            phen_forget_context(context)
          end
        end
      end

      if !Rails.configuration.cache_classes || loading
        PhenomenalRails::Loader.load_files(File.expand_path(PhenomenalRails::PATH,Rails.root))
      end
    end
  end
end
