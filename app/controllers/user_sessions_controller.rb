class UserSessionsController < ApplicationController
  def new
  end 

  def create
    user = User.where('email OR username = ?', params[:login]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to users_sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_sign_in_path
  end
end
