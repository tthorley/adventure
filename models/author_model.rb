require 'digest/sha2'

class Author
  include DataMapper::Resource
  SALT = "foo"
  
  property :id,            Serial
  property :name,          String
  property :password_hash, String, :length => 64
  property :created_at,    DateTime
  
  has n, :pages
  
  def password=(pass)
    self.password_hash = Author.hashify(pass)
  end
  
  def password
    raise "password stored in hashed form"
  end
  
  def self.authenticate(name, password)
    self.first(:name => name, :password_hash => Author.hashify(password))
  end
  
  def self.hashify(string)
    Digest::SHA256.hexdigest(SALT + string)
  end
end