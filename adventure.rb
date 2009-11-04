require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'

CURRENT = File.dirname(__FILE__)
database_file = "/data/data.db"
DataMapper.setup(:default, "sqlite3://" + CURRENT + database_file)

enable :sessions

Dir[CURRENT + '/routes/*.rb'].each{|file| load file}
Dir[CURRENT + '/models/*.rb'].each{|file| load file}