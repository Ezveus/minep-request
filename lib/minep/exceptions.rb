module MINEP
  class ArgumentsError < Exception
  end

  # Raise a ArgumentsError with "Not enough arguments for request" as an argument
  #
  # @param [String] rqst the request which called the function
  def self.notEnoughArgs rqst
    raise ArgumentsError, "Not enough arguments for request #{rqst}"
  end

  # Raise a ArgumentsError with "Missing mandatory arguments for request" as an argument
  #
  # @param [String] rqst the request which called the function
  def self.missingArgs rqst
    raise ArgumentsError, "Missing mandatory arguments for request #{rqst}"
  end
end
