class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # configure do
  #   db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'sinatra_blog')  
  #   set :mongo_db, db[:sinatra_blog]
  # end

  set :views, File.expand_path('../../views', __FILE__)
  set :root, File.dirname(__FILE__)

  enable :sessions

  get '/' do
    binding.pry
   slim :'root/dashboard'
  end

  not_found do
    title 'Not Found!'
    slim :'partials/page_404'
  end
end