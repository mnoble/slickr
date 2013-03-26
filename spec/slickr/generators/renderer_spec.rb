require "spec_helper"

describe Slickr::Generators::Renderer do
  let!(:generator) { described_class.new("hero") }

  before do
    generator.start
  end

  it "has a name" do
    generator.name.should == "hero"
  end

  it "generates a new renderers file" do
    build.join("lib", "renderers", "hero.rb").should exist
  end
end
