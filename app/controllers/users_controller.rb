class UsersController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :destroy]

  # GET /users/:id
  # GET /users/:id.json
  # GET /users/:id.xml
  def show
    @user = User.from_param params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @user, :except => [:password_digest, :auth_token] }
      format.xml  { render :xml  => @user, :except => [:password_digest, :auth_token] }
    end
  end

  # GET /users/:id/liked.json
  # GET /users/:id/liked.xml
  def liked
    @user = User.from_param params[:id]
    @beers = @user.liked

    respond_to do |format|
      format.json { render :json => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
      format.xml  { render :xml  => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
    end
  end

  # GET /users/:id/disliked.json
  # GET /users/:id/disliked.xml
  def disliked
    @user = User.from_param params[:id]
    @beers = @user.disliked

    respond_to do |format|
      format.json { render :json => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
      format.xml  { render :xml  => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
    end
  end

  # GET /users/:id/ignored.json
  # GET /users/:id/ignored.xml
  def ignored
    @user = User.from_param params[:id]
    @beers = @user.ignored

    respond_to do |format|
      format.json { render :json => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
      format.xml  { render :xml  => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
    end
  end

  # GET /users/:id/stashed.json
  # GET /users/:id/stashed.xml
  def stashed
    @user = User.from_param params[:id]
    @beers = @user.stashed

    respond_to do |format|
      format.json { render :json => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
      format.xml  { render :xml  => @beers, :include => { :brewery => { :only => [:name, :permalink] },
                                                          :style => { :only => [:name, :permalink] } } }
    end
  end

  # GET /users/:id/similar.json
  # GET /users/:id/similar.xml
  def similar
    @user = User.from_param params[:id] 
    @users = @user.similar_raters

    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml  => @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render :json => @user }
      format.xml  { render :xml  => @user }
    end
  end

  # POST /users
  # POST /users.json
  # POST /users.xml
  def create
    @user = User.new params[:user]

    respond_to do |format|
      if @user.save
        cookies.permanent[:auth_token] = @user.auth_token
        
        format.html { redirect_to dashboard_path, :notice => 'Welcome to goodbre.ws!'}
        format.json { render :json => @user, :except => :password_digest, :status => :created, :location => @user }
        format.xml  { render :xml  => @user, :except => :password_digest, :status => :created, :location => @user }
      else
        format.html { render :action => :new }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml  => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /account/settings
  def edit
    @user = current_user
  end

  # PUT /account
  # PUT /account.json
  # PUT /account.xml
  def update
    respond_to do |format|
      # Controller should handle attribute whitelisting, not the Model.
      params[:user].slice!(:email, :password, :password_confirmation)

      if current_user.update_attributes params[:user]
        format.html { redirect_to current_user }
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.json { render :json => current_user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml  => current_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /account
  # DELETE /account.json
  # DELETE /account.xml
  def destroy
    current_user.destroy

    respond_to do |format|
      format.html { redirect_to users_sign_in_path }
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
