get 'page/read/:page_number' do
  haml :'page/read'
end

get '/page/edit/:page_number' do
  haml :'page/edit'
end