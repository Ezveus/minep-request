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
      "load" => "Send a LOAD request",
      "shell" => "Send a SHELL request",
      "help" => "Show the list of the commands",
      "exit" => "Disconnect and quit the program",
      "quit" => "Disconnect and quit the program"
    }

    Status ||= [
                "Ok",
                "Request ID is missing",
                "Request is unvalid",
                "Request is unknown",
                "Request argument is unvalid",
                "User is unknown",
                "Signup failed",
                "Action is forbidden",
                "Buffer is unknown",
                "Someone is already logged",
                "Command is unknown",
                "File doesn't exists"
               ]

    def self.CommandsInfo
      CommandsInfo
    end

    def self.sendFile port, path, type
      file = File.new path
      content = file.read
      file.close
      server = nil
      if type == :tcp
        server = TCPServer.new "0.0.0.0", port
      elsif type == :websocket
        server = WEBSocket::Server.new "0.0.0.0", port
      end
      socket = server.accept
      socket.write content
      socket.shutdown :RDWR
      socket.close
      server.close
    end

    def self.readAndParseResponse request, socket
      responsestr = socket.readpartial 4096
      responsetab = responsestr.split '=', 2
      return $stderr.puts "Error while parsing response"if responsetab[0] != "RESPONSE"
      response = {}
      begin
        response = JSON.parse responsetab[1]
      rescue JSON::ParserError => error
        return $stderr.puts "Error while parsing response"
      end
      if !response["status"] or !response["id"] or !response["info"]
        return $stderr.puts "Error while parsing response"
      end
      status = response["status"]
      if status != 0
        return $stderr.puts "Error : #{request.upcase} : #{Status[status]}"
      end
      response
    end

    def self.load socket, type, buflist
      args = {
        :path => "",
        :size => 0,
        :line => 0,
        :type => "up",
        :port => 0
      }
      printf "path : "
      args[:path] = Minep.read
      printf "line number : "
      args[:line] = Minep.read.to_i
      printf "port : "
      args[:port] = Minep.read.to_i
      args[:id] = SecureRandom.uuid
      unless File.exist? args[:path]
        return $stderr.puts "File #{args[:path]} doesn't exists"
      end
      f = File.new args[:path]
      args[:size] = f.size
      f.close
      Thread.start args[:port], args[:path], type do |port, path, type|
        sendFile port, path, type
        Thread.stop
      end
      sleep 2
      puts "LOAD=#{JSON.dump args}"
      socket.write "LOAD=#{JSON.dump args}"
      response = readAndParseResponse "LOAD", socket
      return if response.nil?
      unless response["info"]["uuid"]
        return $stderr.puts "Error while parsing response"
      end
      puts "Buffer id : #{response["info"]["uuid"]}"
      buflist[response["info"]["uuid"]] = response["info"]["uuid"]
      buflist[args[:path]] = response["info"]["uuid"]
      response["status"]
    end

    def self.authenticate socket
      args = {
        :name => "",
        :pass => ""
      }
      ret = Minep.makeMsg("AUTHENTICATE", args)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "AUTHENTICATE", socket
      return if response.nil?
      response["status"]
    end

    def self.signup socket
      args = {
        :name => "",
        :pass => "",
        :email => "",
        :website => ""
      }
      ret = Minep.makeMsg("SIGNUP", args)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "SIGNUP", socket
      return if response.nil?
      response["status"]
    end

    def self.exec socket, buflist
      args = {
        :buffer => "",
        :command => "",
        :args => []
      }
      ret = Minep.makeMsg("EXEC", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "EXEC", socket
      return if response.nil?
      response["status"]
    end

    def self.insert socket, buflist
      args = {
        :buffer => "",
        :text => ""
      }
      ret = Minep.makeMsg("INSERT", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "INSERT", socket
      return if response.nil?
      response["status"]
    end

    def self.move socket, buflist
      args = {
        :buffer => "",
        :direction => "",
        :number => 0
      }
      ret = Minep.makeMsg("MOVE", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "MOVE", socket
      return if response.nil?
      response["status"]
    end

    def self.backspace socket, buflist
      args = {
        :buffer => "",
        :number => 0
      }
      ret = Minep.makeMsg("BACKSPACE", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "BACKSPACE", socket
      return if response.nil?
      response["status"]
    end

    def self.delete socket, buflist
      args = {
        :buffer => "",
        :number => 0
      }
      ret = Minep.makeMsg("DELETE", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "DELETE", socket
      return if response.nil?
      response["status"]
    end

    def self.shell socket, buflist
      args = {
        :command => "",
        :args => []
      }
      ret = Minep.makeMsg("SHELL", args, buflist)
      return if ret.nil?
      socket.write ret
      response = readAndParseResponse "SHELL", socket
      return if response.nil?
      response["status"]
    end
  end
end
