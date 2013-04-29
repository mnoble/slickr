module Slickr
  class Entity
    class << self
      attr_writer :behaviors
    end

    # Specify that an Entity should behave a certain way.
    #
    # @param behavior [Slickr::Behavior] The behavior to use.
    # @param options  [Hash] Default behavior values.
    #
    # @example A Hero can move about the world.
    #
    #   class Hero < Slickr::Entity
    #     use Spatiality
    #   end
    #
    # Different Behaviors will allow you to specify different
    # default values. For example, a Spatiality behavior that
    # allows an Entity to move about the world, may take a
    # default +x+ and +y+ value. The Entity will be placed at
    # that location when the scene is first loaded.
    #
    # @example A Hero starting at a specific location.
    #
    #   class Hero < Slickr::Entity
    #     use Spatiality, x: 100, y: 100
    #   end
    #
    def self.use(behavior, options={})
      behaviors << [behavior, options]
    end

    def self.behaviors
      @behaviors ||= []
    end

    def self.reset
      @behaviors = []
    end

    def initialize
      behaviors.each { |behavior, options| behave_like(behavior, options) }
    end

    def behaviors
      self.class.behaviors
    end

    private

    # Mixin a behavior and configure it with the appropriate options.
    #
    # Each behavior must implement a +prepare+ method that initializes
    # the Entity with any default values. The +prepare+ method will
    # always be that of the last Behavior mixed in.
    #
    def behave_like(behavior, options={})
      extend behavior
      prepare(options)
      EntityManager.register(self, behavior)
    end
  end
end
