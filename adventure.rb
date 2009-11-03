require 'rubygems'
require 'sinatra'
require 'haml'
require 'setup'

enable :sessions

get '/' do
  redirect '/index'
end

get '/index' do
  haml :index
end

get '/about' do
  session[:user] = 1
  haml :about
end

get '/explanation' do
  haml :explanation
end

get '/page/:page_number' do
  
end

get '/signup' do
  
end

get '/login' do
  
end

get '/profile' do
  
end

get '/logout' do
  session[:user] = nil
  redirect '/index'  
end