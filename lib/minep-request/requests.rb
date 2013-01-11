module Minep
  module Request
    CommandsInfo ||= {
      "authenticate" => "Send an AUTHENTICATE request",
      "signup" => "Send a SIGNUP request",
      "exec" => "Send an EXEC request",
      "insert" =>"Send an INSERT request",
      "move" => "Send a MOVE request",
      "backspace" => "Send a BACKSPACE request",
      "delete" => "Send a DELETE request",
      "file" => "Send a FILE request",
      "help" => "Show the list of the commands",
      "exit" => "Disconnect and quit the program",
      "quit" => "Disconnect and quit the program"
    }

    def self.CommandsInfo
      CommandsInfo
    end

    def self.file socket
      args = {
        :path => "",
        :size => 0,
        :line => 0,
        :port => 0
      }
      printf "path : "
      args[:path] = read
      printf "line number : "
      args[:line] = read.to_i
      if File.exist? args[:path]
        f = File.new args[:path]
        args[:size] = f.size
        args[:content] = f.read
        socket.write "FILE=#{JSON.dump args}"
      else
        $stderr.puts "File #{args[:path]} doesn't exists"
      end
    end

    def self.authenticate socket
      args = {
        :name => "",
        :pass => ""
      }
      socket.write Minep.makeMsg("AUTHENTICATE", args)
    end

    def self.signup socket
      args = {
        :name => "",
        :pass => "",
        :email => "",
        :website => ""
      }
      socket.write Minep.makeMsg("SIGNUP", args)
    end

    def self.exec socket
      args = {
        :buffer => "",
        :command => "",
        :args => []
      }
      socket.write Minep.makeMsg("EXEC", args)
    end

    def self.insert socket
      args = {
        :buffer => "",
        :text => ""
      }
      socket.write Minep.makeMsg("INSERT", args)
    end

    def self.move socket
      args = {
        :buffer => "",
        :direction => "",
        :number => 0
      }
      socket.write Minep.makeMsg("MOVE", args)
    end

    def self.backspace socket
      args = {
        :buffer => "",
        :number => 0
      }
      socket.write Minep.makeMsg("BACKSPACE", args)
    end

    def self.delete socket
      args = {
        :buffer => "",
        :number => 0
      }
      socket.write Minep.makeMsg("DELETE", args)
    end
  end
end
