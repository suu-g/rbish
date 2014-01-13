module Rbish
  class Shell
  def self.run(command)
    # TODO: make it better, by using one of the libraries below:
    #   - open3
    #   - systemu
    #   - mixlib-shellout
    puts `#{command}`
  end
  end
end
