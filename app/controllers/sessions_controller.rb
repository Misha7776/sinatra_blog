class SessionsController < ApplicationController

	get '/new' do
    title 'Login'
    slim :'users/login'
  end

  post '/login' do 
    @user = User.find_by(email: params[:email])

    if !@user.nil? && @user.authenticate(params[:password])
      title "#{@user.full_name} Posts"
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.full_name}"
      slim :'/posts/index'
    else
    	flash[:danger] = 'Invalide credentials provided!'
      redirect '/sessions/new'
    end
  end

  get '/logout' do 
  	session.clear
  	redirect '/'
  end
end