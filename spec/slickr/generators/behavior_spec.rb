require "spec_helper"

describe Slickr::Generators::Behavior do
  let!(:generator) { described_class.new("spatial") }

  before do
    generator.start
  end

  it "has a name" do
    generator.name.should == "spatial"
  end

  it "generates a new component file" do
    build.join("lib", "behaviors", "spatial.rb").should exist
  end
end
