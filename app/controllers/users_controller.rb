class UsersController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :destroy]

  def show
    @user = User.from_param(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @user, :except => :password_digest }
      format.xml  { render :xml  => @user, :except => :password_digest }
    end
  end

  def liked
    @user = User.from_param(params[:id])
    @beers = @user.liked

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end

  def disliked
    @user = User.from_param(params[:id])
    @beers = @user.disliked

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end

  def ignored
    @user = User.from_param(params[:id])
    @beers = @user.ignored

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end

  def stashed
    @user = User.from_param(params[:id])
    @beers = @user.stashed

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end

  def similar
    @user = User.from_param(params[:id])
    @users = @user.similar_raters

    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml  => @users }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render :json => @user }
      format.xml  { render :xml  => @user }
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'Successfully registered!'}
        format.json { render :json => @user, :except => :password_digest, :status => :created, :location => @user }
        format.xml  { render :xml  => @user, :except => :password_digest, :status => :created, :location => @user }
      else
        format.html { render :action => :new }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml  => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user }
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml  => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_sign_in_path }
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
