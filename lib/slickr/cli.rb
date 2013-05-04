module Slickr
  class CLI < Thor
    desc "generate GENERATOR NAME", "Generate new code"
    def generate(generator, name)
      Actions::Generate.start
    end

    desc "new NAME [options]", "Create a new jruby slick2d project"
    def new(name)
      Generators::Project.new(name).start
    end
  end
end
