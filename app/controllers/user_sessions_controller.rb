class UserSessionsController < ApplicationController
  # GET /account/sign_in
  def new
  end 

  # POST /account/sign_in
  def create
    user = User.where('email OR username = ?', params[:login]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to sign_in_users_path
    end
  end

  # POST /account/sign_out
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_users_path
  end
end
