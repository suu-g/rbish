require "mixlib/cli"

module Rbish
  class CLI

    include Mixlib::CLI

    option :help,
            :short => "-h",
            :long => "--help",
            :description => "Show this message",
            :on => :tail,
            :boolean => true,
            :show_options => true,
            :exit => 0

    option :log_level,
            :short => "-l LEVEL",
            :long => "--loglevel LEVEL",
            :description => "Set the log level (debug, info, warn, error, fatal)"

    def run(argv=ARGV)
      cmd = nil
      begin
      parse_options(argv)
      parse_cli_arguments
      Config.merge!(config)

      cmd = Command.new(@target, Config)
      rescue => e
      puts "not good"
      exit 1
      end
      if cmd.nil?
        exit 3
      else
        cmd.run
      end
    end

    private

    def parse_cli_arguments
      if target.nil?
        # requires filename when you don't have anything from $stdin
        raise OptionError if $stdin.isatty
        @target = $stdin
      else
        @target = File.open(target, "r")
      end
    end

    # Returns target File object.
    def target
      return cli_arguments.first
    end
  end
end
