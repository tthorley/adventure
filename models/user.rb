class User
  include DataMapper::Resource
  
  property :id,            Serial
  property :username,      String
  property :password_salt, String
  property :password_hash, String
  
  def password=(pass)
    
  end
  
  def password
    raise "password stored in hashed form"
  end
end