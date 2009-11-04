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