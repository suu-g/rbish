require "mixlib/cli"

module Rbish
  class CLI

    include Mixlib::CLI

    option :version,
      :short => "-v",
      :long => "--version",
      :description => "Show version",
      :boolean => true,
      :default => nil

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

    def version_check
      if config[:version]
        puts "rbish #{Rbish::VERSION}"
        exit 0
      end
    end

    def run(argv=ARGV)
      parse_options(argv)
      version_check
      parse_cli_arguments
      Config.merge!(config)

      cmd = Command.new(@target, Config)
      cmd.run
    rescue OptionError => e
      Rbish.error("#{e.class}: #{e.message}")
      exit 1
    rescue => e
      Rbish.error("#{e.class}: #{e.message}")
      exit 3
    end

    private

    def parse_cli_arguments
      if target.nil?
        # requires filename when you don't have anything from $stdin
        raise OptionError, "Please specify file name." if $stdin.isatty
        @target = $stdin
      else
        begin
          @target = File.open(target, "r")
        rescue SystemCallError => e
          raise OptionError, "Couldn't open file #{target}." if $stdin.isatty
        end
      end
    end

    # Returns target File object.
    def target
      return cli_arguments.first
    end
  end
end

