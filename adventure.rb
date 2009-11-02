require 'rubygems'
require 'sinatra'
require 'haml'
require 'setup'

get '/' do
  redirect '/index'
end

get '/index' do
  haml :index
end

get '/about' do
  haml :about
end

get '/explanation' do
  haml :explanation
end

get '/page/:page_number' do
  
end