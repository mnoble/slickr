module Slickr
  module Generators
    class System < Base
      def start
        template "system.erb", "lib/systems/#{name}.rb"
      end
    end
  end
end
