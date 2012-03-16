class BreweriesController < ApplicationController
  # GET /breweries/:id
  # GET /breweries/:id.json
  # GET /breweries/:id.xml
  def show
    @brewery = Brewery.from_param params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @brewery }
      format.xml  { render :xml  => @brewery }
    end
  end

  # GET /breweries/:id/beers.json
  # GET /breweries/:id/beers.xml
  def beers
    @brewery = Brewery.from_param params[:id]
    @beers = @brewery.beers

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end
end
