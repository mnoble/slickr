module Slickr
  module Actions
    class Generate < Thor
      desc "component NAME", "Generate a new component"
      def component(name)
        Generators::Component.new(name).start
      end

      desc "entity NAME", "Generate a new entity"
      def entity(name)
        Generators::Entity.new(name).start
      end

      desc "renderer NAME", "Generate a new renderer"
      def renderer(name)
        Generators::Renderer.new(name).start
      end

      desc "system NAME", "Generate a new system"
      def system(name)
        Generators::System.new(name).start
      end
    end
  end
end
