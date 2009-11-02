class Page
  include DataMapper::Resource
  
  property :id,         Serial
  property :content,    Text
  property :published,  Boolean, :default => false
  property :created_at, DateTime
  property :choice_id,  Integer
  property :user_id,    Integer
  
  has n, :choices
  belongs_to :user
  belongs_to :choice
end