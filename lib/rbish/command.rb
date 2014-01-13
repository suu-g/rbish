require "erb"
require "tilt"

module Rbish
  class Command
    def initialize(fd, config)
      @fd = fd
      @config = config
    end

    def run
      template = Tilt::ERBTemplate.new { @fd.read }
      ::Rbish::Shell.run(template.render)
    end
  end
end
