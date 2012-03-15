class PagesController < ApplicationController
  before_filter :authorize, :only => :dashboard

  # GET /welcome
  def welcome
  end

  # GET /dashboard
  def dashboard
  end

  # GET /about
  def about
  end

  # GET /privacy
  def privacy
  end

  # GET /terms
  def terms
  end
end
