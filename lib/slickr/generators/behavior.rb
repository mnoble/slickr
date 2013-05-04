module Slickr
  module Generators
    class Behavior < Base
      def start
        template "behavior.erb", "lib/behaviors/#{name}.rb"
      end
    end
  end
end
