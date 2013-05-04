module Slickr
  module Actions
    # Adapter for calling the different types of Generators.
    #
    # This class takes the name of the generator, in any form, and
    # the name the user wants to give to the new piece of code. It
    # will normalize both to follow Slickr conventions.
    #
    # == Naming Conventions
    #
    # Slickr follows the same sort of conventions as Rails. Classes
    # are appended with their type. Eg. a "spatiality" behavior will
    # become +SpatialityBehavior+, a "hero" renderer will become
    # +HeroRenderer+, etc.
    #
    # @example Generating a new behavior
    #   Slickr::Actions::Generate.new("behavior", "spatiality").start
    #   # => lib/behaviors/spatiality_behavior.rb
    #
    # @example Generating a new behavior by specifying the full name
    #   Slickr::Actions::Generate.new("behavior", "spatiality_behavior").start
    #   # => lib/behaviors/spatiality_behavior.rb
    #
    # @example Generating a new behavior by specifying the name in class form
    #   Slickr::Actions::Generate.new("behavior", "SpatialityBehavior").start
    #   # => lib/behaviors/spatiality_behavior.rb
    #
    class Generate
      def initialize(type, name)
        @type = type
        @name = name
      end

      def start
        generator_class.new(name).start
      end

      def generator_class
        Slickr::Generators.const_get(:"#{@type.capitalize}")
      end

      def name
        "#{basename}_#{@type}".squeeze("_")
      end

      def basename
        @name.gsub(/#{@type}/i, "").downcase
      end
    end
  end
end
