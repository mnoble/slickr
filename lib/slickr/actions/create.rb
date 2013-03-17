module Slickr
  module Actions
    class Create
      def initialize(name)
        @name = name
      end

      def start
        empty_directory "java"
        empty_directory "assets"
        empty_directory "lib"
        empty_directory "lib", "renderers"
        empty_directory "lib", "components"
        empty_directory "lib", "systems"
        empty_directory "lib", "entities"

        copy_file "jinput.jar", "java"
        copy_file "lwjgl.jar",  "java"
        copy_file "slick.jar",  "java"

        copy_file "libjinput-osx.jnilib"
        copy_file "liblwjgl.jnilib"
        copy_file "openal.dylib"

        copy_file "Rakefile"

        template "engine.erb",     "engine.rb"
        template "components.erb", "components.rb"
        template "renderers.erb",  "renderers.rb"
        template "systems.erb",    "systems.rb"
        template "entities.erb",   "entities.rb"
      end

      def empty_directory(*path)
        project_directory.join(*path).mkpath
      end

      def copy_file(filename, destination="")
        FileUtils.cp(root.join("files", filename), project_directory.join(destination, filename))
      end

      def template(filename, destination)
        file = lib_file(destination)
        file.write(render(template_source(filename)))
        file.close
      end

      protected

      def lib_file(filename)
        project_directory.join("lib", filename).open("w+")
      end

      def render(source)
        ERB.new(source).result(binding)
      end

      def template_source(filename)
        root.join("templates", filename).read
      end

      def module_name
        name.gsub(" ", "_").camelize
      end

      def name
        @name
      end

      def project_directory
        @project_directory ||= Pathname.new(name)
      end

      def root
        @root ||= Pathname.new(__FILE__).join("../../../../").expand_path
      end
    end
  end
end
