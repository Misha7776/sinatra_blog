require 'sinatra/base'
require 'sinatra/flash'
require 'slim'
require 'pry'
require 'mongo'
require 'json/ext'
require 'mongoid'
require 'bcrypt'

Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

map('/users') { run UsersController }
map('/posts') { run PostsController }
map('/sessions') { run SessionsController }
map('/') { run ApplicationController }
