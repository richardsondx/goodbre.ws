class UserSessionsController < ApplicationController
  # GET /account/sign_in
  def new
  end 

  # POST /account/sign_in
  def create
    user = User.find_by_login params[:login]

    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to dashboard_path, :notice => "Signed in!"
    else
      flash.now.alert = "Invalid username/email or password"
      render "new"
    end
  end

  # POST /account/sign_out
  def destroy
    cookies.delete :auth_token
    redirect_to welcome_path, :notice => "Signed out."
  end
end
