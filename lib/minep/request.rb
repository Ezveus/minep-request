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
    "\t-> authenticate\n\t-> signup\n\t-> exec\n\t-> insert\n\t-> move\n\t-> backspace\n\t-> delete\n"
  end
  
  module Request
    def self.authenticate request, opts={}
      MINEP.notEnoughArgs "AUTHENTICATE" if opts.empty?
      MINEP.missingArgs "AUTHENTICATE" if opts[:name].nil? or opts[:pass].nil?
      Utils.makeAuthenticate request, opts
    end

    def self.signup request, opts={}
      MINEP.notEnoughArgs "SIGNUP" if opts.empty?
      MINEP.missingArgs "SIGNUP" if opts[:name].nil? or opts[:pass].nil? or opts[:email].nil?
      Utils.makeSignup request, opts
    end

    def self.exec request, opts={}
      MINEP.notEnoughArgs "EXEC" if opts.empty?
      MINEP.missingArgs "SIGNUP" if opts[:buffer].nil? or opts[:command].nil? or opts[:args].nil?
    end

    def self.insert request, opts={}
      MINEP.notEnoughArgs "INSERT" if opts.empty?
      MINEP.missingArgs "INSERT" if opts[:buffer].nil? or opts[:text].nil?
    end

    def self.move request, opts={}
      MINEP.notEnoughArgs "MOVE" if opts.empty?
      MINEP.missingArgs "MOVE" if opts[:buffer].nil? or opts[:direction].nil? or opts[:number].nil?
    end

    def self.backspace request, opts={}
      MINEP.notEnoughArgs "BACKSPACE" if opts.empty?
      MINEP.missingArgs "BACKSPACE" if opts[:buffer].nil? or opts[:number].nil?
    end

    def self.delete request, opts={}
      MINEP.notEnoughArgs "DELETE" if opts.empty?
      MINEP.missingArgs "DELETE" if opts[:buffer].nil? or opts[:number].nil?
    end
  end
end
