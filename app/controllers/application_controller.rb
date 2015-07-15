class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def search_users(string)
    usernamed = User.where('username LIKE ? OR first_name LIKE ? OR last_name LIKE ?', "%#{string}%", "%#{string}%", "%#{string}%")
  end

  helper_method :current_user
end
