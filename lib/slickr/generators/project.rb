module Slickr
  module Generators
    class Project < Base
      def initialize(name)
        super(name)
        @destination = @destination.join(name)
      end

      def start
        empty_directory "java"
        empty_directory "assets"
        empty_directory "lib"
        empty_directory "lib/renderers"
        empty_directory "lib/components"
        empty_directory "lib/systems"
        empty_directory "lib/entities"

        copy_file "jinput.jar", "java"
        copy_file "lwjgl.jar",  "java"
        copy_file "slick.jar",  "java"

        copy_file "libjinput-osx.jnilib"
        copy_file "liblwjgl.jnilib"
        copy_file "openal.dylib"

        copy_file "Rakefile"

        template "entity_manager.erb", "lib/entity_manager.rb"
        template "engine.erb",         "lib/engine.rb"
        template "components.erb",     "lib/components.rb"
        template "renderers.erb",      "lib/renderers.rb"
        template "systems.erb",        "lib/systems.rb"
        template "entities.erb",       "lib/entities.rb"
      end
    end
  end
end
