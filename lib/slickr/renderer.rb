module Slickr
  # Renderers take the current state of an entity and draws it to
  # the screen.
  #
  # @example Simple renderer that draws a graphic on the screen
  #
  #   class HeroRenderer < Slickr::Renderer
  #     attr_reader :image
  #
  #     def initialize(entity)
  #       super
  #       @image = Image.new("assets/hero.png", false)
  #     end
  #
  #     def render
  #       image.draw(entity.x, entity.y)
  #     end
  #   end
  #
  # == Never Mutate Entities
  #
  # Renderers should know as little as possible about the entity it's
  # drawing. They should also never, ever, mutate an entity. They only 
  # request information and push a representation of that to the screen.
  #
  class Renderer
    attr_reader :entity

    def initialize(entity)
      @entity = entity
    end

    def render
      raise NotImplementedError
    end
  end
end
