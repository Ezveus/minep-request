module MINEP
  class Connection < EM::Connection
    def initialize request
      super
      @request = "Should be a valid request\n"
    end

    def post_init
      send_data @request
    end

    def receive_data data
      puts data
      unbind
    end

    def unbind
      EventMachine::stop_event_loop
    end
  end
end
