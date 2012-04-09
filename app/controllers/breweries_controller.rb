class BreweriesController < ApplicationController
  # GET /breweries/:id
  # GET /breweries/:id.json
  # GET /breweries/:id.xml
  def show
    @brewery = Brewery.from_param params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render_for_api :public, :json => @brewery }
      format.xml  { render_for_api :public, :xml  => @brewery }
    end
  end

  # GET /breweries/:id/beers.json
  # GET /breweries/:id/beers.xml
  def beers
    @brewery = Brewery.from_param params[:id]
    @beers = @brewery.beers

    respond_to do |format|
      format.json { render_for_api :brewery, :json => @beers }
      format.xml  { render_for_api :brewery, :xml  => @beers }
    end
  end
end
