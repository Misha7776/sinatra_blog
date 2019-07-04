class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  register Sinatra::Flash

  configure do
    Mongoid.load!('./database.yml', :development)
    Mongoid.raise_not_found_error = false
  end

  set :views, File.expand_path('../../views', __FILE__)
  set :root, File.dirname(__FILE__)

  enable :sessions
  set :session_secret, 'sinatra_auth_secret'

  get '/' do
    title current_user ? "#{current_user.full_name} dashboard" : 'Dashboard'
    slim :'root/dashboard'
  end

  not_found do
    title 'Not Found!'
    slim :'partials/page_404'
  end
end
