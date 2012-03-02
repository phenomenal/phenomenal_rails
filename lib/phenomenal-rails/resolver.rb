# TODO check if optimized version used by rails
class Phenomenal::Resolver < ActionView::FileSystemResolver
  def find_templates(name, prefix, partial, details)
    contexts = find_sorted_active_contexts
    contexts.each do |context|
      context_path = context.to_path
      if !context_path.nil?
        path = Path.build(name, "#{context_path}/views/#{prefix}", partial)
        query = query(path, details, details[:formats])
        return query unless query.empty?
      end
    end
    return []
  end

  private
  def find_sorted_active_contexts
    contexts = phen_defined_contexts.find_all{|c| c.active?}
    contexts.sort!{|a,b| Phenomenal::Manager.instance.conflict_policy(a,b)}
  end
end
