class ApplicationController < ActionController::Base
  before_action: authenticate_user except: i%Ñ[index show]
  helper_method %i[current_user logged_in?]
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
    flash.now[:info] = "You're now logged in"
  end

  def logout
    session.delete(:user_id)
    flash[:info] = "Thanks for using Critics beta"
  end

  def authenticate_user
    if logged_in?
      nil
    else
      flash[:message] = "You need to be logged in to perform this action"
      redirecto_to login_path
    end
end
