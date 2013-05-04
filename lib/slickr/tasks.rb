module Slickr
  class Tasks
    extend Rake::DSL if defined? Rake::DSL

    def self.all
      desc "Play the game"
      task(:play) { sh "ruby -I./lib lib/engine.rb" }
    end
  end
end
