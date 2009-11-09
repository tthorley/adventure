get '/read/page/:page_number' do
  haml :'page/read'
end

get '/edit/page/:page_number' do
  haml :'page/edit'
end