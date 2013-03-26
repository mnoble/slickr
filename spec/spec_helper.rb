$: << File.expand_path("../../lib", __FILE__)
require "slickr"

module Helpers
  def build
    root.join("spec", "build")
  end

  def game
    build.join("A Game")
  end

  def root
    Pathname.new(__FILE__).join("..", "..").expand_path
  end
end

RSpec.configure do |c|
  c.include Helpers
  c.before { Dir.chdir(build) }
  c.after  { build.children.each { |c| c.rmtree unless c.basename.to_s == ".gitkeep" }}
end
