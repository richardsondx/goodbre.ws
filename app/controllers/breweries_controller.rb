class BreweriesController < ApplicationController
  def show
    @brewery = Brewery.from_param(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @brewery }
      format.xml  { render :xml  => @brewery }
    end
  end

  def beers
    @brewery = Brewery.from_param(params[:id])
    @beers = @brewery.beers

    respond_to do |format|
      format.json { render :json => @beers }
      format.xml  { render :xml  => @beers }
    end
  end
end
