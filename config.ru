ENV['RACK_ENV'] = "production"

require 'adventure'
run Sinatra::Application