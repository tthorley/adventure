get '/signup' do
  
  haml :'user/signup'
end

get '/login' do
  
  haml :'user/login'
end

get '/profile' do
  
  haml :'user/profile'
end

get '/logout' do
  session[:user] = nil
  redirect '/index'  
end