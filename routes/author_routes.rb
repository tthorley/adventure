get '/author/signup' do
  @errors = session[:errors]
  session[:errors] = nil
  haml :'author/signup'
end

post '/author/signup' do
  errors = ""
  params[:author].each{|key,value| errors += "#{key} cannot be blank<br/>" if value.nil? || value.empty?}
  errors += "author already exists<br/>" if Author.first(:name => params[:author][:name])
  errors += "code is invalid<br/>"  unless params[:author][:code] == Author.hashify(params[:author][:name])
  errors += "passwords don't match" unless params[:author][:password] == params[:author][:verify]
  unless errors.empty?
    session[:errors] = errors
    redirect '/author/signup'
  end
  author = Author.create(:name => params[:author][:name], :password => params[:author][:password])
  session[:author] = author
  redirect '/author/profile'
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
