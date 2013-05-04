require "spec_helper"

describe Slickr::Actions::Generate do
  it "finds the generator class from its lowercase name" do
    action = described_class.new("behavior", "spatiality")
    action.generator_class.should == Slickr::Generators::Behavior
  end

  it "finds the generator class from its Capitalized name" do
    action = described_class.new("Behavior", "spatiality")
    action.generator_class.should == Slickr::Generators::Behavior
  end

  it "finds the generator class from its ALL CAPS name" do
    action = described_class.new("BEHAVIOR", "spatiality")
    action.generator_class.should == Slickr::Generators::Behavior
  end

  it "finds the generator class from its FuCkEdUpCaSe name" do
    action = described_class.new("BeHaViOr", "spatiality")
    action.generator_class.should == Slickr::Generators::Behavior
  end

  it "adds the object type to its name" do
    action = described_class.new("behavior", "spatiality")
    action.name.should == "spatiality_behavior"
  end

  it "does not change the name when its already in the correct form" do
    action = described_class.new("behavior", "spatiality_behavior")
    action.name.should == "spatiality_behavior"
  end

  it "does nothing to the name is in class form" do
    action = described_class.new("behavior", "SpatialityBehavior")
    action.name.should == "spatiality_behavior"
  end
end
