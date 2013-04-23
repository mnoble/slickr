module Slickr
  module Generators
    class Base
      attr_accessor :name
      attr_accessor :destination

      def initialize(name)
        @name = name
        @destination = Pathname.new(Dir.pwd)
      end

      # Create an empty directory at +path+ inside the project.
      #
      # @param path [String] Path in the project to create the directory.
      #
      # @example
      #   empty_directory "lib"
      #
      def empty_directory(path)
        destination.join(with_correct_path_seperator(path)).mkpath
      end

      # Copy a file from ROOT/files to somewhere in the project
      # directory.
      #
      # This does not render anything, it's just a simple +cp+.
      #
      # @param filename [String] Name of the source file located in ROOT/files
      # @param path [String] Path to place the file in the project
      #
      # @example Place file in the root of the project
      #   copy_file "Rakefile"
      #
      # @example Place file somewhere nested in the project
      #   copy_file "jinput.jar", "java"
      #   # => Creates PROJECT/java/jinput.jar
      #
      def copy_file(filename, path="")
        source = root.join("files", filename)
        dest   = destination.join(path, filename)
        FileUtils.cp(source, dest)
      end

      # Render an erb template at a specific path within
      # the project.
      #
      # Renders ERB in the context of the class calling this method.
      # Meaning you'll need to make whatever variables you want in your template
      # available within the class. See Actions::Create, +name+ is an accessor
      # and used in the template.
      #
      # @param filename [String] Name of the erb template living in ROOT/templates
      # @param path [String] Path in the project to write the resulting file
      #
      # @example
      #   template "application.erb", "app/application.rb"
      #
      def template(filename, path)
        file = lib_file(with_correct_path_seperator(path))
        file.dirname.mkpath
        file.open("w+") { |f| f << render(template_root(filename)) }
      end

      def to_object(string)
        string.gsub(" ", "_").camelize
      end

    private

      # Root of this gem, where the source files live.
      #
      def root
        @root ||= Pathname.new(__FILE__).dirname.expand_path
      end

      # Normalizes file paths per OS.
      #
      # You can just use "/" in your calls to Util methods
      # and it will update paths to whatever the OS actually
      # uses.
      #
      def with_correct_path_seperator(path)
        path.gsub("/", File::SEPARATOR)
      end

      def lib_file(filename)
        destination.join(filename)
      end

      def render(source)
        ERB.new(source).result(binding)
      end

      def template_root(filename)
        root.join("templates", filename).read
      end
    end
  end
end
