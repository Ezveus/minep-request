# minep-request

minep-request is a binary allowing to communicate with a [MINE
server](http://github.com/Ezveus/Mine).

It uses MINE Protocol over TCP using Ruby Standard Sockets or over
WebSocket Protocol using
[WEBSocket](https://rubygems.org/gems/WEBSocket).

It works as an interactive 'shell' reading some commands (or requests
arguments) on the standard input and sends valid MINEP requests to the
server.

The known commands are :
- authenticate : Send an AUTHENTICATE request
- backspace : Send a BACKSPACE request
- delete : Send a DELETE request
- exec : Send an EXEC request
- exit : Disconnect and quit the program
- help : Show the list of the commands
- insert : Send an INSERT request
- load : Send a LOAD request
- move : Send a MOVE request
- quit : Disconnect and quit the program
- signup : Send a SIGNUP request

Without arguments, the default communication type is TCP trying to
connect to localhost on port 8080 (default MINE over TCP port). See
the [usage](#usage) to change the host, port or communication type.

If the communication type is WebSocket and no port is given, the port
is updated to Mine over WebSocket default port (8081).

## Installation

Add this line to your application's Gemfile:

    gem 'minep-request'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minep-request

## <div id="usage">Usage</div>

Usage: mine-request [OPTIONS]
Send a request to a MINE server
    -h, --host HOST                  server hostname
    -p, --port PORT                  server port
    -t, --type TYPE                  type of communication (tcp |
    websocket)
        --help                       displays this screen

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
