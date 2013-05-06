require "spec_helper"

describe Slickr::EntityManager do
  let!(:entity) { mock }

  before do
    Slickr::EntityManager.register(entity, (class SpatialBehavior; self; end))
  end

  it "registers an entity" do
    Slickr::EntityManager.entities.should include entity
  end

  it "registers an entity with a behavior" do
    Slickr::EntityManager.entities[entity].should include :spatial
  end

  it "finds entities with a specific behavior" do
    Slickr::EntityManager.entities_with(:spatial).should include entity
  end

  it "finds entities with a subset of behaviors" do
    Slickr::EntityManager.register(entity, (class Size; self; end))
    Slickr::EntityManager.entities_with(:size).should include entity
  end

  it "finds entities with multiple behaviors" do
    Slickr::EntityManager.register(entity, (class Size; self; end))
    Slickr::EntityManager.entities_with(:spatial, :size).should include entity
  end
end
