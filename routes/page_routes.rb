get '/create/page' do
  haml :'page/create'
end

get '/read/page/:page_number' do
  @page = Page.get(params[:page_number])
  if @page
    @footer_left = @page.author.name
    @footer_right = @page.id
    haml :'page/read'
  else
    redirect '/missing/page'
  end
end

get '/edit/page/:page_number' do
  haml :'page/edit'
end

get 'missing/page/?'
  haml :'page/missing'
end