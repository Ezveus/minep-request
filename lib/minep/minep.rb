module MINEP
  # Send a request to opts\[:host\] or localhost on port
  # opts\[:port\] or 8080
  #
  # @param [Symbol] type the request type, see main page for the requests list
  # @param [Hash] opts stores the parameters of the request and host and port, see main page for the requests parameters
  # @param [Bool] closeLoop define if the event loop has to be closed when unbinding
  def self.send type, opts={}
    request = {}
    return false unless Utils.makeRequest request, type, opts
    EM.run do
      EM.connect(opts[:host] || "localhost",
                 opts[:port] || 8080, Connection, request,
                 opts[:closeLoop])
    end
  end
end
