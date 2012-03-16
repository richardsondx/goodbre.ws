class StylesController < ApplicationController
  # GET /styles/:id
  # GET /styles/:id.json
  # GET /styles/:id.xml
  def show
    @style = Style.from_param params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @style }
      format.xml  { render :xml  => @style }
    end
  end

  # GET /styles/:id/beers.json
  # GET /styles/:id/beers.xml
  def beers
    @style = Style.from_param params[:id]
    @beers = @style.beers

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
end
