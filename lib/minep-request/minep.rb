module Minep
  def self.read
    input = $stdin.readline
    input = input.strip
  end

  def self.makeMsg request, args
    args.each_key do |k|
      if k == :args
        printf "#{k} as a space-separated list : "
        input = read
        args[k] = input.split
      elsif k == :direction
        printf "#{k} (up, right, down, left, origin, end) : "
        args[k] = read
      elsif k == :number
        printf "#{k} : "
        args[k] = read.to_i
      else
        printf "#{k} : "
        args[k] = read
      end
    end
    "#{request.upcase}=#{JSON.dump args}"
  end
end
