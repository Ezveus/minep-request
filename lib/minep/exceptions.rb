module MINEP
  class ArgumentsError < Exception
  end

  def self.notEnoughArgs rqst
    raise ArgumentsError, "Not enough arguments for request #{rqst}"
  end

  def self.missingArgs rqst
    raise ArgumentsError, "Missing mandatory arguments for request #{rqst}"
  end
end
