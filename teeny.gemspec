require './lib/teeny/version'

Gem::Specification.new do |s|
  s.name        = 'teeny'
  s.version     = Teeny::VERSION
  s.summary     = "Make teeny tiny services"
  s.description = "A tool that lets you make a teeny service by just writing a script"
  s.authors     = ["Dan Tao"]
  s.email       = 'daniel.tao@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb')
  s.executables = ['teeny']
  s.homepage    = 'https://github.com/dtao/teeny'
  s.license     = 'MIT'

  s.add_runtime_dependency 'json', '~> 1.0'
  s.add_runtime_dependency 'sinatra', '~> 1.0'
end
