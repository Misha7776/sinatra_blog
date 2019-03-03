module ApplicationHelper
  def title(value = nil)
    @title = value if value
    @title ? "Blog - #{@title}" : "Controller Demo"
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
  	user = User.find_by(id: session[:user_id])
    return user unless user.nil?

    User.new
  end
end