module Slickr
  # Provides a central repository for storing and querying for Entities
  # that exhibit some behavior.
  #
  # Each scene of your game will probably have many entities. When you 
  # instantiate one of those Entities, it's automatically registered
  # to the +EntityManager+, with the behaviors it implements.
  #
  # @example
  #
  #     class Boss < Slickr::Entity
  #       use Spatial, x: 0, y: 0
  #     end
  #
  #     boss = Boss.new
  #     # => #<Boss components=[:spatial]>
  #
  #     EntityManager.entities
  #     # => [#<Boss components=[:spatial]>]
  #
  # Systems and Renderers are the two things that will likely need to
  # alter or manipulate entities. Systems change the data associated
  # with an entity and Renderers draw that to the screen. These objects
  # can ask the +EntityManager+ for any entities that care about the
  # behaviors they affect.
  #
  # @example
  #
  #     class Systems::Input
  #       def call(delta)
  #         entities.each { |e| e.up(delta) } if up_key?
  #       end
  #
  #       def entities
  #         EntityManager.entities_with(:controllable, :spatial)
  #       end
  #     end
  #
  # The +Input+ system cares about entities that can be moved by keyboard
  # or mouse input and have spatial awareness; that is, things that can
  # move. The above +System+ tells an entity to move up if the up key is
  # pressed. What "moving up" means is determined by the component. The
  # System doesn't care; it just reacts to events in the world and tells
  # entities to do stuff based on that.
  #
  # It's important to view +:controllable+ and +:spatial+ as behaviors.
  # Systems and Renderers expect these objects to conform to some standard
  # API. We don't care where the object came from, what type it is or
  # what it does outside of what we expect. We're going for good object
  # oriented design through duck typing here.
  #
  module EntityManager
    extend self

    # @!attribute entities
    #   Hash of entities and their registered components
    #
    def entities
      @entities ||= reset!
    end

    # Register an +Entity+ as conforming to a specific +Component+
    # behavior.
    #
    # @param entity [Entity] The +Entity+ that includes the behavior
    # @param type [Module] A +Component+ module.
    #
    def register(entity, type)
      entities[entity] << symbolize(type)
    end

    # Retrieve all registered entities that include all of the 
    # components passed.
    #
    # @param components [Array<Component>] List of components
    #
    # @example
    #   EntityManager.entities
    #   => { #<Entity components=[:spatial, :size]>, #<Entity components=[:spatial]> }
    #
    #   EntityManager.entities_with(:spatial, :size)
    #   => #<Entity components=[:spatial, :size]>
    #
    def entities_with(*components)
      entities.select { |entity, types| includes_all?(types, Set[*components]) }.keys
    end

    # Remove all entities.
    #
    def reset!
      @entities = Hash.new { |h,k| h[k] = Set.new }
    end

    private

    def includes_all?(types, items)
      items.subset?(types)
    end

    def symbolize(type)
      type.name.demodulize.underscore.to_sym
    end
  end
end

