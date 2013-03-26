module Slickr
  class CLI < Thor
    register Slickr::Actions::Generate, "generate", "generate GENERATOR [args] [options]", "Generate new code"

    desc "new NAME [options]", "Create a new jruby slick2d project"
    method_options %w(output -o) => :string
    def new(name)
      Generators::Project.new(name, options).start
    end
  end
end
