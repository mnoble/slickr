module Slickr
  module Generators
    class Entity < Base
      def start
        template "entity.erb", "lib/entities/#{name}.rb"
        Renderer.new(name.gsub("entity", "renderer")).start
      end
    end
  end
end
