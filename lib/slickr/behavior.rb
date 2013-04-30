module Slickr
  # Behaviors give entities the ability to do things. They should
  # implement the logic to move around the world, detect collision,
  # etc.
  #
  # A behavior should not care about what entities use it. It should
  # specify all the attribute and methods relevant to what it does.
  #
  # @example Behavior that lets entities move within the world
  #
  #   module Spatiality
  #     include Slickr::Behavior
  #
  #     attr_access :x, :y, :speed
  #
  #     def prepare(options={})
  #       @x = options.fetch(:x, 0)
  #       @y = options.fetch(:y, 0)
  #       @speed = options.fetch(:speed, 0)
  #     end
  #
  #     def up(delta)
  #       self.y -= speed * delta
  #     end
  #
  #     def down(delta)
  #       self.y += speed * delta
  #     end
  #
  #     def left(delta)
  #       self.x -= speed * delta
  #     end
  #
  #     def right(delta)
  #       self.x += speed * delta
  #     end
  #
  # == Preparing
  #
  # since behaviors are modules that get mixed into entities, we can't
  # use the normal +initialize+ to set defaults. Instead, Slickr uses
  # a convention of the +prepare+ method.
  #
  # When you specify an entity should implement some behavior, it's 
  # pushed into the entity's behavior stack. When that entity is
  # instantiated, it will run through all of its behaviors and
  # +prepare+ each one with the options specified in the entity.
  #
  # @example
  #
  #   class Hero < Slickr::Entity
  #     use Spatiality, x: 10, y: 10, speed: 0.2
  #   end
  #
  #   hero = Hero.new
  #   hero.x #=> 10
  #   hero.y #=> 10
  #   hero.speed #=> 0.2
  #
  # == Don't Clobber Behavior Attributes
  #
  # Use good OO common-sense here. Don't create multiple behaviors that
  # all depend on attributes of the same name. Behaviors should be 
  # independent of one another.
  #
  module Behavior
    def prepare(*args)
      raise NotImplementedError
    end
  end
end
