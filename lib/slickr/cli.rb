module Slickr
  class CLI < Thor
    register Slickr::Actions::Generate, "generate", "generate GENERATOR [args] [options]", "Generate new code"
    register Slickr::Actions::Generate, "g", "generate GENERATOR [args] [options]", "Generate new code"

    desc "new NAME [options]", "Create a new jruby slick2d project"
    def new(name)
      Generators::Project.new(name).start
    end
  end
end
