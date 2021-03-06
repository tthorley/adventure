class Choice
  include DataMapper::Resource
  
  property :id,      Serial
  property :option,  String
  property :page_id, Integer
  
  belongs_to :parent_page, :model => 'Page', :child_key => [:page_id]
  has 1, :page
end