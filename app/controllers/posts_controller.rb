class PostsController < ApplicationController
  helpers ApplicationHelper

  get '/' do
    if logged_in?
      title 'User Posts'
      slim :'posts/index'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  get '/new' do
    if logged_in?
      slim :'posts/new'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  post '/create' do
    if logged_in?
      @post = current_user.posts.create(params)
      redirect '/posts'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  get '/:id/edit' do
    if logged_in?
      current_post
      @title = "Edit #{current_user.full_name} profile"
      slim :'posts/edit'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  post '/:id/update' do
    if logged_in?
      if current_post.update(params)
        flash[:success] = 'Post updated!'
      else
        flash[:warning] = 'Update failed, please fill all required fields'
      end
      redirect '/posts'
    else
      flash[:info] = 'Please, authenticate yourself first!'
      redirect '/'
    end
  end

  get '/:id/delete' do
    if logged_in? && current_user.id
      current_post.delete
      flash[:success] = 'Post deleted!'
      redirect '/posts'
    else
      flash[:info] = 'Ooops! Something went wrong.'
      redirect '/'
    end
  end

  private

  def current_post
    current_user.posts.find_by(id: params[:id])
  end
end
