get '/signup' do
  
  haml :'author/signup'
end

get '/login' do
  
  haml :'author/login'
end

get '/profile' do
  
  haml :'author/profile'
end

get '/logout' do
  session[:author] = nil
  redirect '/index'  
end