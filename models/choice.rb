class Choice
  include DataMapper::Resource
  
  property :id,      Serial
  property :option,  String
  property :page_id, Integer
  
  belongs_to :page
end