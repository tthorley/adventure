class Page
  include DataMapper::Resource
  
  property :id,          Serial
  property :content,     Text
  property :published,   Boolean, :default => false
  property :created_at,  DateTime
  property :modified_at, DateTime
  property :choice_id,   Integer
  property :author_id,     Integer
  
  has n, :choices
  belongs_to :author
  belongs_to :parent_choice, :model => 'Choice', :child_key => [:choice_id]
end