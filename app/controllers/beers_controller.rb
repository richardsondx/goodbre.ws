class BeersController < ApplicationController
  before_filter :authorize, :except => :show

  # GET /beers/:id.json
  # GET /beers/:id.xml
  def show
    @beer = Beer.find params[:id]

    respond_to do |format|
      format.json { render_for_api :public, :json => @beer }
      format.xml  { render_for_api :public, :xml  => @beer }
    end
  end

  # POST /beers/:id/like.json
  # POST /beers/:id/like.xml
  def like
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.like @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/:id/like.json
  # DELETE /beers/:id/like.xml
  def unlike
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.unlike @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # POST /beers/:id/dislike.json
  # POST /beers/:id/dislike.xml
  def dislike
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.dislike @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/:id/dislike.json
  # DELETE /beers/:id/dislike.xml
  def undislike
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.undislike @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # POST /beers/:id/ignore.json
  # POST /beers/:id/ignore.xml
  def ignore
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.ignore @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/:id/ignore.json
  # DELETE /beers/:id/ignore.xml
  def unignore
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.unignore @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # POST /beers/:id/stash.json
  # POST /beers/:id/stash.xml
  def stash
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.stash @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/:id/stash.json
  # DELETE /beers/:id/stash.xml
  def unstash
    @beer = Beer.find params[:id]

    respond_to do |format|
      if current_user.unstash @beer
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { head :unprocessable_entity }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
end
