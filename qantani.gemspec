Gem::Specification.new do |s|
  s.name    = 'qantani'
  s.version = '0.0.1'
  s.author  = 'Pepijn Looije'
  s.email   = 'pepijn@plict.nl'
  s.description = s.summary = 'Easier Qantani payments'
  s.homepage = 'https://github.com/pepijn/qantani'

  s.required_ruby_version = '>= 2'

  s.add_dependency 'httparty'
  s.add_dependency 'activesupport'
  s.add_dependency 'builder'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'sinatra'

  s.files = Dir["#{File.dirname(__FILE__)}/**/*"]
end

