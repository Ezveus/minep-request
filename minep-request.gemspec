Gem::Specification.new do |s|
  s.name        = 'minep-request'
  s.version     = '0.0.2'
  s.date        = '2012-11-13'
  s.summary     = "Allows to communicate with a MINE server"
  s.description = <<-EOS
Allows to communicate with a MINE server.
Supported requests are the same as the implemented requests in the server : AUTHENTICATE and SIGNUP.
  EOS
  s.authors     = ["Matthieu Ciappara"]
  s.email       = 'ciappam@gmail.com'
  s.files       = ["lib/minep.rb",
                   "lib/minep-request.rb",
                   "lib/minep/connection.rb",
                   "lib/minep/exceptions.rb",
                   "lib/minep/minep.rb",
                   "lib/minep/request.rb",
                   "lib/minep/utils.rb",
                   "README.md"]
  s.homepage    = 'https://github.com/Ezveus/minep-request'
  s.executables << 'mine-request'
end
