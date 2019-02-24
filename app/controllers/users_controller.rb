class UsersController < ApplicationController
  get '/login' do
    title "Login Page"
    slim :'users/login'
  end
end