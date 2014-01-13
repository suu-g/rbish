require "mixlib/log"

require "rbish/version"
require "rbish/cli"
require "rbish/command"
require "rbish/config"
require "rbish/shell"

module Rbish
  class OptionError < StandardError; end

  class Log
    extend Mixlib::Log
  end

  # not capable in ruby 1.8
  [:debug, :info, :warn, :error, :fatal].each do |meth|
    define_singleton_method(meth){ Log.send(meth) }
  end

  def self.init
    Log.init($stderr)
  end
end

Rbish.init
