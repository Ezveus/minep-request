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

  # Returns an array containing the request list
  def self.requestList
    RequestList
  end

  # Returns a string containing the request list under the form "\t-> request\n..."
  def RequestList.to_s
    "\t-> authenticate\n\t-> signup\n\t-> exec\n\t-> insert\n\t-> move\n\t-> backspace\n\t-> delete\n"
  end

  # Module containing methods for checking requests arguments
  module Request

    # Checks arguments for authenticate and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :name The user login/email
    # @option opts [String] :pass The user password
    def self.authenticate request, opts={}
      MINEP.notEnoughArgs "AUTHENTICATE" if opts.empty?
      MINEP.missingArgs "AUTHENTICATE" if opts[:name].nil? or opts[:pass].nil?
      Utils.makeAuthenticate request, opts
    end

    # Checks arguments for signup and create the request body
    # @param [String] website is the url of the website of the new user, passed through opts
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :name The login of the new user
    # @option opts [String] :pass The password of the new user
    # @option opts [String] :email The email of the new user
    def self.signup request, opts={}
      MINEP.notEnoughArgs "SIGNUP" if opts.empty?
      MINEP.missingArgs "SIGNUP" if opts[:name].nil? or opts[:pass].nil? or opts[:email].nil?
      Utils.makeSignup request, opts
    end

    # Checks arguments for exec and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :buffer The buffer on which you apply the command
    # @option opts [String] :command The command to apply
    # @option opts [Array] :args The (potentially empty) array containing arguments for the command
    def self.exec request, opts={}
      MINEP.notEnoughArgs "EXEC" if opts.empty?
      MINEP.missingArgs "SIGNUP" if opts[:buffer].nil? or opts[:command].nil? or opts[:args].nil?
    end

    # Checks arguments for insert and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :buffer The buffer on which you insert text
    # @option opts [String] :text The text to insert
    def self.insert request, opts={}
      MINEP.notEnoughArgs "INSERT" if opts.empty?
      MINEP.missingArgs "INSERT" if opts[:buffer].nil? or opts[:text].nil?
    end

    # Checks arguments for move and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :buffer The buffer on which you move the cursor
    # @option opts [Symbol] :direction The direction of the move
    # @option opts [Integer] :number The range of the move (unused on :origin or :end move)
    def self.move request, opts={}
      MINEP.notEnoughArgs "MOVE" if opts.empty?
      MINEP.missingArgs "MOVE" if opts[:buffer].nil? or opts[:direction].nil? or opts[:number].nil?
    end

    # Checks arguments for backspace and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :buffer The buffer on which you suppress
    # @option opts [Integer] :number The range of the suppression
    def self.backspace request, opts={}
      MINEP.notEnoughArgs "BACKSPACE" if opts.empty?
      MINEP.missingArgs "BACKSPACE" if opts[:buffer].nil? or opts[:number].nil?
    end

    # Checks arguments for delete and create the request body
    #
    # @param [Hash] request will contain the request (headers and body)
    # @param [Hash] opts contains the options and arguments get from MINEP.send
    # @option opts [String] :buffer The buffer on which you delete
    # @option opts [Integer] :number The range of the deletion
    def self.delete request, opts={}
      MINEP.notEnoughArgs "DELETE" if opts.empty?
      MINEP.missingArgs "DELETE" if opts[:buffer].nil? or opts[:number].nil?
    end
  end
end
