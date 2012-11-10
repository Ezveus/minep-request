module MINEP
  RequestList = [
                 :authenticate,
                 :signup,
                 :exec,
                 :insert,
                 :move,
                 :backspace,
                 :delete
                ]

  def self.requestList
    RequestList
  end

  def RequestList.to_s
    # res = ""
    # RequestList.each do |rqst|
    #   res += "\t-> #{rqst}\n"
    # end
    # res
    "\t-> authenticate\n\t-> signup\n\t-> exec\n\t-> insert\n\t-> move\n\t-> backspace\n\t-> delete\n"
  end
  
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
