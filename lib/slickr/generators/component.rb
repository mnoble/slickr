module Slickr
  module Generators
    class Component < Base
      def start
        template "component.erb", "lib/components/#{name}.rb"
      end
    end
  end
end
