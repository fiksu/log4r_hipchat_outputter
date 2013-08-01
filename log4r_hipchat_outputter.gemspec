$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "log4r_hipchat_outputter/version"

Gem::Specification.new do |s|
 s.name        = 'log4r_hipchat_outputter'
 s.version     = Log4rHipchatOutputter::VERSION
 s.license     = 'New BSD License'
 s.date        = '2013-08-01'
 s.summary     = "Log4r outputter for hipchat."
 s.description = "an log4r outputter for hipchat."
 s.authors     = ["Keith Gabryelski"]
 s.email       = 'keith@fiksu.com'
 s.files       = `git ls-files`.split("\n")
 s.require_path = 'lib'
 s.homepage    = 'http://github.com/keithgabryelski/log4r_hipchat_outputter'
 s.add_dependency "log4r"
 s.add_dependency "hipchat"
end
