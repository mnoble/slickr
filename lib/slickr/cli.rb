module Slickr
  class CLI < Thor
    desc "generate GENERATOR NAME", "Generate new code"
    def generate(generator, name)
      Actions::Generate.new(generator, name).start
    end

    desc "g GENERATOR NAME", "Shortcut for generate", hide: true
    def g(*args)
      generate(*args)
    end

    desc "new NAME [options]", "Create a new jruby slick2d project"
    def new(name)
      Generators::Project.new(name).start
    end
  end
end
