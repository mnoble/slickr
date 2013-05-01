module Slickr
  # Reactors take info about the game world and tell relevant
  # entities to do something. Emphasis is on the word "tell".
  #
  # == Concerns
  #
  # Reactors are always concerned with entities who implement
  # one or more specific behaviors. For instance, an # +InputReactor+
  # would care about entities who implement the +Controllable+
  # behavior.
  #
  # @example
  #
  #   class InputReactor < Slickr::Reactors
  #     concerned_with :controllable
  #   end
  #
  # == Using Ractors
  #
  # Reactors are middleware of your game's Engine. They are called
  # during every +update+ tick of your game. They are passed the
  # game's +container+ and the +delta+ of time that has passed since 
  # the last tick.
  #
  # @example
  #
  #   class Engine < BasicGame
  #     use InputReactor
  #   end
  #
  # if you need to do some special setup in your Reactors, do it
  # in the initializer like any normal ruby object.
  #
  # @example
  #
  #   class Engine < BasicGame
  #     use InputReactor.new(:ignore => :up)
  #   end
  #
  # == Reacting
  #
  # Reactors simply orcestrate. They take that delta and tell the
  # entities they care about to do something. Following the above
  # example, here's a simple Reactor that moves entities around
  # the world.
  #
  # @example
  #
  #   class InputReactor < Slickr::Reactor
  #     concerned_with :controllable
  #
  #     def call(container, delta)
  #       entities.each do |entity|
  #         entity.up(delta)    if input.is_key_down?(Input::KEY_UP)
  #         entity.down(delta)  if input.is_key_down?(Input::KEY_DOWN)
  #         entity.right(delta) if input.is_key_down?(Input::KEY_RIGHT)
  #         entity.left(delta)  if input.is_key_down?(Input::KEY_LEFT)
  #       end
  #     end
  #   end
  #
  class Reactor
    class << self
      attr_accessor :concerns
    end

    def self.concerned_with(*behaviors)
      @concerns ||= []
      @concerns += behaviors
    end

    def call(*args)
      raise NotImplementedError
    end

    def entities
      EntityManager.entities_with(*concerns)
    end

    private

    def concerns
      self.class.concerns
    end
  end
end
