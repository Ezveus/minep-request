module MINEP
  module Request
    def self.authenticate request, opts={}
      return false if opts.empty?
      return false if opts[:name].nil? or opts[:pass].nil?
      Utils.makeAuthenticate request, opts
    end

    def self.signup request, opts={}
      return false if opts.empty?
      return false if opts[:name].nil? or opts[:pass].nil? or opts[:email].nil?
    end

    def self.exec request, opts={}
      return false if opts.empty?
      return false if opts[:buffer].nil? or opts[:command].nil? or opts[:args].nil?
    end

    def self.insert request, opts={}
      return false if opts.empty?
      return false if opts[:buffer].nil? or opts[:text].nil?
    end

    def self.move request, opts={}
      return false if opts.empty?
      return false if opts[:buffer].nil? or opts[:direction].nil? or opts[:number].nil?
    end

    def self.backspace request, opts={}
      return false if opts.empty?
      return false if opts[:buffer].nil? or opts[:number].nil?
    end

    def self.delete request, opts={}
      return false if opts.empty?
      return false if opts[:buffer].nil? or opts[:number].nil?
    end
  end
end
