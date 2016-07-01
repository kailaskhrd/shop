class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash['error'] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def authorize_login
    redirect_to '/login' unless current_user
  end

   # Returns the current logged-in user (if any).
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end