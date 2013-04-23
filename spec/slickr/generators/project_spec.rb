require "spec_helper"

describe Slickr::Generators::Project do
  let!(:generator) { described_class.new("A Game") }

  before do
    generator.start
  end

  it "creates the project directory" do
    game.should be_directory
  end

  it "creates a java directory" do
    game.join("java").should be_directory
  end

  it "creates a lib directory" do
    game.join("lib").should be_directory
  end

  it "creates a lib/renderers directory" do
    game.join("lib", "renderers").should be_directory
  end

  it "creates a lib/components directory" do
    game.join("lib", "components").should be_directory
  end

  it "creates a lib/systems directory" do
    game.join("lib", "systems").should be_directory
  end

  it "creates a lib/entities directory" do
    game.join("lib", "entities").should be_directory
  end

  it "creates an assets directory" do
    game.join("assets").should be_directory
  end

  it "copies jinput.jar into the java directory" do
    game.join("java", "jinput.jar").should exist
  end

  it "copies lwjgl.jar into the java directory" do
    game.join("java", "lwjgl.jar").should exist
  end

  it "copies slick.jar into the java directory" do
    game.join("java", "slick.jar").should exist
  end

  it "copies libjinput-osx.jnilib into the project directory" do
    game.join("libjinput-osx.jnilib").should exist
  end

  it "copies liblwjgl.jnilib into the project directory" do
    game.join("liblwjgl.jnilib").should exist
  end

  it "copies openal.dylib into the project directory" do
    game.join("openal.dylib").should exist
  end

  it "creates the components file" do
    game.join("lib", "components.rb").should exist
  end

  it "creates the renderers file" do
    game.join("lib", "renderers.rb").should exist
  end

  it "creates the systems file" do
    game.join("lib", "systems.rb").should exist
  end

  it "creates the systems file" do
    game.join("lib", "entities.rb").should exist
  end

  it "creates the engine file skeleton" do
    File.read(game.join("lib", "engine.rb")).should == <<-CODE
$LOAD_PATH << File.expand_path("../../java", __FILE__)
require "java"
require "lwjgl.jar"
require "slick.jar"

$LOAD_PATH << File.expand_path("../../lib", __FILE__)
require "entity_manager"
require "components"
require "entities"
require "renderers"
require "systems"

java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input

class Engine < BasicGame
  def init(container)
  end

  def update(container, delta)
  end

  def render(container, graphics)
  end
end

game = AppGameContainer.new(Engine.new("A Game"))
game.set_display_mode(800, 600, false)
game.start

    CODE
  end
end
