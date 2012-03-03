class StylesController < ApplicationController
  def show
    @style = Style.from_param(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @style, :include => :beers }
      format.xml  { render :xml  => @style, :include => :beers }
    end
  end
end
