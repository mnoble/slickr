module Slickr
  class ActionLogger
    PADDING = 14
    COLORS = {
      :green  => "\x1b[32m",
      :orange => "\x1b[1;31m",
      :reset  => "\x1b[0m"
    }

    attr_reader :out, :err

    def initialize(out=$stdout, err=$stderr)
      @out = out
      @err = err
    end

    def created(file)
      log color(:green, "create"), file
    end

    def exists(file)
      log color(:orange, "exists"), file
    end

    private

    def log(action, file)
      out.puts "#{action}  #{relative(file)}"
    end

    def relative(file)
      file.to_s.gsub(Pathname.pwd.to_s, "").gsub(/^\//, "")
    end

    def color(color, str)
      "#{COLORS[color]}#{str}#{COLORS[:reset]}"
    end
  end
end

