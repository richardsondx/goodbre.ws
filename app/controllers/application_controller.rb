class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def signed_in?
    current_user ? true : false
  end

  protected

  def authorize
    signed_in?
  end
end
