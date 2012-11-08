module MINEP
  module Utils
    def self.makeRequest request, type, opts
      Utils.getHeader request, opts[:host], opts[:port]
      case type
      when :authenticate then Request.authenticate request, opts
      when :signup then Request.signup request, opts
      when :exec then Request.exec request, opts
      when :insert then Request.insert request, opts
      when :move then Request.move request, opts
      when :backspace then Request.backspace request, opts
      when :delete then Request.delete request, opts
      else
        false
      end
    end
    
    def self.getHeader request, host=nil, port=nil
      host = "localhost" if host.nil?
      port = 8080 if host.nil?
      request[:header] = {
        :head => "POST /mine/protocol/request HTTP/1.1",
        :host => "#{host}:#{port}",
        :connection => "Close",
        :contentType => "application/x-www-form-urlencoded",
        :contentLength => 0
      }
      true
    end

    def self.makeAuthenticate request, options
      request[:body] = {
        :authenticate => options
      }
      true
    end
  end
end
