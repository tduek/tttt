class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:current_user_id]

    @current_user ||= User.find(session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    @current_user = user
    session[:current_user_id] = user.id
  end

  def log_out!
    @current_user = nil
    session[:current_user_id] = nil
  end
end
