class PhenomenalRails::Resolver < ActionView::OptimizedFileSystemResolver
  include Singleton
  
  def find_all(name, prefix=nil, partial=false, details={}, key=nil, locals=[])
    contexts = phen_defined_contexts.find_all do |c| 
      c.active? && 
      (details[:feature].empty? ? true : c==feature(*details[:feature]))
    end
    contexts.sort!{|a,b| Phenomenal::Manager.instance.conflict_policy(a,b)}
    find_all_contexts(name,contexts, prefix, partial, details, key, locals)
  end
  
  def find_all_inactive(name, prefix=nil, partial=false, details={}, key=nil, locals=[])
    contexts = phen_defined_contexts.find_all do |c| 
      !c.active? && 
      (details[:feature].empty? ? true : c==feature(*details[:feature]))
    end
    find_all_contexts(name,contexts, prefix, partial, details, key, locals)
  end
  
  private
  def initialize()
    super(PhenomenalRails::PATH)
    @cached={}
  end
  
  def cached(template, path, formats)
    if caching?
      @cached[template]||=yield
    else
      yield
    end 
  end
  
  def find_all_contexts(name,contexts, prefix=nil, partial=false, details={}, key=nil, locals=[])
    contexts.each do |context|
      context_path = context.to_path
      if !context_path.nil?
        path = Path.build(name, "#{context_path}/views/#{prefix}", partial)
        query = query(path, details, details[:formats])
        locals = locals.map { |x| x.to_s }.sort!
        decorate(query,[name,prefix,partial],details,locals)
        return query unless query.empty?
      end
    end
    return []
  end
  
  def query(path, details, formats)
    query = build_query(path, details)
    # deals with case-insensitive file systems.
    sanitizer = Hash.new { |h,dir| h[dir] = Dir["#{dir}/*"] }
    template_paths = Dir[query].reject { |filename|
      File.directory?(filename) ||
        !sanitizer[File.dirname(filename)].include?(filename)
    }
    template_paths.map { |template|
      cached(template, path, formats) do
        handler, format = extract_handler_and_format(template, formats)
        contents = File.binread template

        ActionView::Template.new(contents, File.expand_path(template), handler,
          :virtual_path => path.virtual,
          :format       => format,
          :updated_at   => mtime(template))
      end
    }
  end
end
