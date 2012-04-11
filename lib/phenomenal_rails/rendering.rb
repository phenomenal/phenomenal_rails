module ActionController
  module Rendering
    def render_context(*args)
      begin
        puts "********* #{args}"
        render(*args)
      rescue Exception => e
        phen_defined_contexts.each do |context|

        end
      end
    end
  end
end
