require "mixlib/config"

module Rbish
  class Config
    extend Mixlib::Config

    config_strict_mode true
  end
end
