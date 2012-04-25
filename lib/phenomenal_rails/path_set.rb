ActionView::LookupContext.register_detail(:feature)  {[]} #-> add the details to the options hash
module ActionView
  class PathSet
    def find(*args)
      templates = find_all(*args)
      if templates.empty?
        if find_all_inactive(*args).empty?
          raise(MissingTemplate.new(self, *args))
        else
          ActionView::Template::Text.new("","text")
        end
      else
        templates.first || raise(MissingTemplate.new(self, *args))
      end
    end
    
    private
    def find_all_inactive(path, prefixes = [], *args)
      prefixes = [prefixes] if String === prefixes
      prefixes.each do |prefix|
        templates = paths.find{|p| p.is_a?Phenomenal::Resolver}.find_all_inactive(path, prefix, *args)
        return templates unless templates.empty?
      end
      []
    end
  end
end
