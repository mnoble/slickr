require "spec_helper"

describe Slickr::Actions::Create do
  let!(:action)  { described_class.new("A Game") }
  let!(:rootdir) { Pathname.new(__FILE__).join("../../../../").expand_path }
  let!(:gamedir) { Pathname.new("A Game") }

  before do
    # Need the actual template contents so we can compare the rendered output
    engine     = rootdir.join("templates", "engine.erb").read
    renderers  = rootdir.join("templates", "renderers.erb").read
    components = rootdir.join("templates", "components.erb").read
    systems    = rootdir.join("templates", "systems.erb").read

    FakeFS.activate!

    rootdir.mkpath
    rootdir.join("files").mkpath

    # The contents of these don't matter, so just make empty files
    FileUtils.touch(rootdir.join("files", "jinput.jar"))
    FileUtils.touch(rootdir.join("files", "lwjgl.jar"))
    FileUtils.touch(rootdir.join("files", "slick.jar"))
    FileUtils.touch(rootdir.join("files", "libjinput-osx.jnilib"))
    FileUtils.touch(rootdir.join("files", "liblwjgl.jnilib"))
    FileUtils.touch(rootdir.join("files", "openal.dylib"))

    # Write templates to FakeFS
    rootdir.join("templates").mkpath
    rootdir.join("templates", "engine.erb").open("w+") { |f| f << engine }
    rootdir.join("templates", "components.erb").open("w+") { |f| f << components }
    rootdir.join("templates", "renderers.erb").open("w+") { |f| f << renderers }
    rootdir.join("templates", "systems.erb").open("w+") { |f| f << systems }

    # Finally
    action.start
  end

  after do
    FakeFS.deactivate!
  end

  it "creates the project directory" do
    gamedir.should be_directory
  end

  it "creates a java directory" do
    gamedir.join("java").should be_directory
  end

  it "creates a lib directory" do
    gamedir.join("lib").should be_directory
  end

  it "creates a lib/renderers directory" do
    gamedir.join("lib", "renderers").should be_directory
  end

  it "creates a lib/components directory" do
    gamedir.join("lib", "components").should be_directory
  end

  it "creates a lib/systems directory" do
    gamedir.join("lib", "systems").should be_directory
  end

  it "creates a lib/entities directory" do
    gamedir.join("lib", "entities").should be_directory
  end

  it "creates an assets directory" do
    gamedir.join("assets").should be_directory
  end

  it "copies jinput.jar into the java directory" do
    gamedir.join("java", "jinput.jar").should exist
  end

  it "copies lwjgl.jar into the java directory" do
    gamedir.join("java", "lwjgl.jar").should exist
  end

  it "copies slick.jar into the java directory" do
    gamedir.join("java", "slick.jar").should exist
  end

  it "copies libjinput-osx.jnilib into the project directory" do
    gamedir.join("libjinput-osx.jnilib").should exist
  end

  it "copies liblwjgl.jnilib into the project directory" do
    gamedir.join("liblwjgl.jnilib").should exist
  end

  it "copies openal.dylib into the project directory" do
    gamedir.join("openal.dylib").should exist
  end

  it "creates the engine file skeleton" do
    File.read(gamedir.join("lib", "engine.rb")).should == <<-CODE
$LOAD_PATH << File.expand_path("../../java", __FILE__)
require "java"
require "lwjgl.jar"
require "slick.jar"

java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input

module AGame
  class Engine < BasicGame
    def init(container)
    end

    def update(container, delta)
    end

    def render(container, graphics)
    end
  end
end

game = AppGameContainer.new(AGame::Engine.new("A Game"))
game.set_display_mode(800, 600, false)
game.start

    CODE
  end

  it "creates the components file" do
    File.read(gamedir.join("lib", "components.rb")).should == <<-CODE
module AGame
  module Components
  end
end

    CODE
  end

  it "creates the renderers file" do
    File.read(gamedir.join("lib", "renderers.rb")).should == <<-CODE
module AGame
  module Renderers
  end
end

    CODE
  end

  it "creates the systems file" do
    File.read(gamedir.join("lib", "systems.rb")).should == <<-CODE
module AGame
  module Systems
  end
end

    CODE
  end

  it "creates the systems file" do
    File.read(gamedir.join("lib", "entities.rb")).should == <<-CODE
module AGame
  module Entities
  end
end

    CODE
  end
end
