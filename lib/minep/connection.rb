module MINEP
  # This class extends EM::Connection (the connection class of EventMachine)
  class Connection < EM::Connection
    # Initialize the object
    #
    # @param [Hash] request is the request, The text request is built from this
    def initialize request, closeLoop=false
      super
      @request = ["#{request[:header][:head]}\n"]
      @closeLoop = closeLoop
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

    # Send the request after the connection initialization
    def post_init
      send_data @request
    end

    # Receive the answer of the server and puts it on standard output
    def receive_data data
      puts data
    end

    def unbind
      EventMachine::stop_event_loop if @closeLoop
    end
  end
end
