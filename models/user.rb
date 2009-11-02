require 'digest/sha2'

class User
  include DataMapper::Resource
  SALT = "foo"
  
  property :id,            Serial
  property :username,      String
  property :password_hash, String, :length => 64
  property :created_at,    DateTime
  
  has n, :pages
  
  def password=(pass)
    self.password_hash = User.hashify(pass)
  end
  
  def password
    raise "password stored in hashed form"
  end
  
  def self.authenticate(username, password)
    self.first(:username => username, :password_hash => User.hashify(password))
  end
  
  def self.hashify(string)
    Digest::SHA256.hexdigest(string + SALT)
  end
end