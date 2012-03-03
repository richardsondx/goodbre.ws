class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])

    respond_to do |format|
      format.json { render :json => @beer, :include => :style }
      format.xml  { render :xml  => @beer, :include => :style }
    end
  end

  def like
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.like(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def unlike
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.unlike(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def dislike
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.dislike(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def undislike
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.undislike(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def ignore
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.ignore(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def unignore
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.unignore(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def stash
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.stash(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end

  def unstash
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if current_user.unstash(@beer)
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.json { render :json => { :status => false }, :status => :unprocessable_entity }
        format.xml  { render :xml  => { :status => false }, :status => :unprocessable_entity }
      end
    end
  end
end
