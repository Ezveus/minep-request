module MINEP
  def self.send type, opts={}
    request = {}
    return false unless Utils.makeRequest request, type, opts
    EM.run do
      EM.connect(opts[:host] || "localhost",
                 opts[:port] || 8080, Connection, request)
    end
  end
end
