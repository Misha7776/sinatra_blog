class UsersController < ApplicationController
  helpers ApplicationHelper

  get '/new' do
    if logged_in?
      redirect '/'
    else
      @user = User.new
      title 'Create your account'
      slim :'users/new'
    end
  end

  post '/create' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You have successfuly created your account!'
      redirect '/'
    else
      flash[:warning] = 'Registration failed because:'
      redirect '/users/new'
    end
  end

  get '/:id/edit' do
    if logged_in?
      @title = "Edit #{current_user.full_name} profile"
      slim :'users/edit'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  post '/:id/update' do
    if logged_in?
      if current_user.update(params)
        flash[:success] = 'Attributes updated!'
      else
        flash[:warning] = 'Update failed, please fill all required fields'
      end
      redirect "users/#{current_user.id}/edit"
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  get '/:id/delete' do
    if current_user && current_user.id.to_s == params[:id]
      current_user.delete
      session.clear
      flash[:info] = 'Account deleted!'
    else
      flash[:warning] = 'Ooops! Something went wrong.'
    end
    redirect '/'
  end
end
