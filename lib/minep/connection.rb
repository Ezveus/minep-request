module MINEP
  class Connection < EM::Connection
    def initialize request
      super
      @request = ["#{request[:header][:head]}\n"]
      request[:header].each do |key, value|
        if key == :head
          next
        elsif key == :contentType
          @request << "Content-Type: #{value}\n"
        elsif key == :contentLength
          @request << "Content-Length: #{value}\n"
        else
          @request << "#{key.to_s.capitalize}: #{value}\n"
        end
      end
      @request << "\n"
      key = request[:body].keys[0]
      rqst = "#{key.to_s.upcase}="
      rqst += "#{JSON.dump request[:body][key]}\n"
      @request << rqst
      @request = @request.join
    end

    def post_init
      send_data @request
    end

    def receive_data data
      puts data
    end

    def unbind
      puts "Unbind"
      EventMachine::stop_event_loop
    end
  end
end
