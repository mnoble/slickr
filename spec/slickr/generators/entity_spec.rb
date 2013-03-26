require "spec_helper"

describe Slickr::Generators::Entity do
  let!(:generator) { described_class.new("hero") }

  before do
    generator.start
  end

  it "has a name" do
    generator.name.should == "hero"
  end

  it "generates a new entity file" do
    build.join("lib", "entities", "hero.rb").should exist
  end

  it "generates a new renderer file" do
    build.join("lib", "renderers", "hero.rb").should exist
  end
end
