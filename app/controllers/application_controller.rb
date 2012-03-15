class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    true if current_user
  end

  def authorize
    redirect_to sign_in_users_url, :alert => "Please sign in to continue." unless signed_in?
  end

  helper_method :current_user, :signed_in?
end
