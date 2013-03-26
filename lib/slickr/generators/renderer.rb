module Slickr
  module Generators
    class Renderer < Base
      def start
        template "renderer.erb", "lib/renderers/#{name}.rb"
      end
    end
  end
end
