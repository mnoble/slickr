require "spec_helper"

describe Slickr::Entity do
  before do
    Slickr::Entity.reset
  end

  it "has behaviors" do
    Slickr::Entity.behaviors.should respond_to :each
  end

  it "uses behaviors" do
    Slickr::Entity.use :foo
    Slickr::Entity.behaviors.should == [[:foo, {}]]
  end

  it "uses behaviors with specific characteristics" do
    Slickr::Entity.use :bar, speed: 10
    Slickr::Entity.behaviors.should == [[:bar, {speed: 10}]]
  end
end
