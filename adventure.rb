require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'

CURRENT = File.dirname(__FILE__)

configure(:development) { DataMapper.setup(:default, "sqlite3://#{CURRENT}/data/development.db") }
configure(:test) { DataMapper.setup(:default, "sqlite3://#{CURRENT}/data/test.db") }
configure(:production) { DataMapper.setup(:default, "sqlite3://#{CURRENT}/data/production.db") }

enable :sessions

Dir[CURRENT + '/routes/*.rb'].each{|file| load file}
Dir[CURRENT + '/models/*.rb'].each{|file| load file}