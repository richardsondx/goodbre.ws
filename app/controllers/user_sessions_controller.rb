class UserSessionsController < ApplicationController
  def new
  end 

  def create
    user = User.where('email OR username = ?', params[:login]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_url
    else
      redirect_to sign_in_users_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_users_url
  end
end
