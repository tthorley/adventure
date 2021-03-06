# Copyright (c) 2009 Tad Thorley
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without 
# restriction, including without limitation the rights to use, 
# copy, modify, merge, publish, distribute, sublicense, and/or 
# sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

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

get '/missing' do
  haml :'main/missing'
end

get '/*' do
  redirect '/missing'
end