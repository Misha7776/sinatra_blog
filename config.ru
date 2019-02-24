require 'sinatra/base'
require 'slim'
require 'pry'
require 'mongo'
require 'json/ext'
require 'mongo_mapper'

Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

map('/') { run ApplicationController }
map('/users') { run UsersController }
