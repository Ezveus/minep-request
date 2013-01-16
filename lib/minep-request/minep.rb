module Minep
  def self.read
    input = $stdin.readline
    input = input.strip
  end

  def self.makeMsg request, args, buflist = nil
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
    if buflist and args[:buffer]
      bufferName = args[:buffer]
      args[:buffer] = buflist[bufferName]
      return $stderr.puts "Error : This buffer doesn't exists" if args[:buffer].nil?
    end
    args["id"] = SecureRandom.uuid
    "#{request.upcase}=#{JSON.dump args}"
  end
end
