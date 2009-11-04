require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'

ROOT_PATH     = Dir.pwd
database_file = "/data/data.db"
DataMapper.setup(:default, "sqlite3://" + ROOT_PATH + database_file)

enable :sessions

route_files = Dir.entries("./routes/").find_all{|m| m =~ /\.rb/}
model_files = Dir.entries("./models/").find_all{|m| m =~ /\.rb/}

route_files.each{|file| load "./routes/" + file}
model_files.each{|file| load "./models/" + file}