class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  def authorize_login
    redirect_to '/login' unless current_user
  end

   # Returns the current logged-in user (if any).
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
