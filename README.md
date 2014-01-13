# Rbish

A erb-shellscript executor

## Installation

Install it yourself as:

    $ gem install rbish

## Usage

Just give the filename of your shellscript to rbish.

    $ rbish myscript.sh

rbish can take strings from STDIN as well.

    $ rbish < myscript.sh

You can use ERB in your shellscript whereever you like.

    $ cat myscript.sh
    #!/bin/sh
    <% (1..10).each do |i| %>
    sudo arping -c 1 <%= "192.168.10.2%02d" % i %>
    <% end %>

## Contributing

1. Fork it ( http://github.com/suu-g/rbish/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
