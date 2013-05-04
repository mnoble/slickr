require "spec_helper"

describe Slickr::Generators::Reactor do
  let!(:generator) { described_class.new("input") }

  before do
    generator.start
  end

  it "has a name" do
    generator.name.should == "input"
  end

  it "generates a new system file" do
    build.join("lib", "reactors", "input.rb").should exist
  end
end
