module Slickr
  module Generators
    class Reactor < Base
      def start
        template "reactor.erb", "lib/reactors/#{name}.rb"
      end
    end
  end
end
