class StylesController < ApplicationController
  # GET /styles/:id
  # GET /styles/:id.json
  # GET /styles/:id.xml
  def show
    @style = Style.from_param params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render_for_api :public, :json => @style }
      format.xml  { render_for_api :public, :xml  => @style }
    end
  end

  # GET /styles/:id/beers.json
  # GET /styles/:id/beers.xml
  def beers
    @style = Style.from_param params[:id]
    @beers = @style.beers

    respond_to do |format|
      format.json { render_for_api :style, :json => @beers }
      format.xml  { render_for_api :style, :xml  => @beers }
    end
end
