get '/author/signup' do
  haml :'author/signup'
end

post '/author/signup' do
  
end

get '/author/login' do
  
  haml :'author/login'
end

get '/author/logout' do
  session[:author] = nil
  redirect '/index'  
end

get '/author/profile' do
  
  haml :'author/profile'
end
