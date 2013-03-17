module Slickr
  class CLI < Thor
    desc "new NAME", "Create a new jruby slick2d project"
    method_options :name => :string
    def new(name)
      Actions::Create.new(name).start
    end
  end
end
