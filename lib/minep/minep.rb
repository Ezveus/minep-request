module MINEP
  # Send a request to opts[:host] or localhost on port
  # opts[:port] or 8080
  #
  # @param [Symbol] type the request type, see main page for the requests list
  # @param [Hash] opts stores the parameters of the request and host and port, see main page for the requests parameters
  def self.send type, opts={}
    request = {}
    return false unless Utils.makeRequest request, type, opts
    EM.run do
      EM.connect(opts[:host] || "localhost",
                 opts[:port] || 8080, Connection, request)
    end
  end
end
