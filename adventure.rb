require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'

ENV['RACK_ENV'] ||= "development"
ROOT_DIR = Dir.pwd

configure(:development) { DataMapper.setup(:default, "sqlite3://#{ROOT_DIR}/data/development.db") }
configure(:test) { DataMapper.setup(:default, "sqlite3://#{ROOT_DIR}/data/test.db") }
configure(:production) { DataMapper.setup(:default, "sqlite3://#{ROOT_DIR}/data/production.db") }

enable :sessions

Dir[ROOT_DIR + '/routes/*.rb'].each{|file| load file}
Dir[ROOT_DIR + '/models/*.rb'].each{|file| load file}