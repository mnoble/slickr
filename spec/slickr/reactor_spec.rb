require "spec_helper"

describe Slickr::Reactor do
  it "is concerned with entities implementing certain behaviors" do
    class InputReactor < Slickr::Reactor
      concerned_with :spatiality
    end

    InputReactor.concerns.should include :spatiality
  end

  it "has a list of entities who implement the behaviors it's concerned about" do
    module Spatiality
      def prepare(*) end
    end

    class Hero < Slickr::Entity
      use Spatiality
    end

    hero = Hero.new
    reactor = InputReactor.new
    reactor.entities.should include hero
  end
end
