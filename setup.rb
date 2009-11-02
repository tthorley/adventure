require 'rubygems'
require 'dm-core'

ROOT_PATH     = Dir.pwd
database_file = "/data/data.db"
model_files   = Dir.entries("./models/").find_all{|m| m=~ /\.rb/}

DataMapper.setup(:default, "sqlite3://" + ROOT_PATH + database_file)
model_files.each{|file| load "./models/" + file}