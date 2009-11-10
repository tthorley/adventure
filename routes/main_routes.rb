get '/' do
  redirect '/index'
end

get '/index' do
  haml :'main/index'
end

get '/about' do
  haml :'main/about'
end

get '/explanation' do
  haml :'main/explanation'
end