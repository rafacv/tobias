class WatchlistsController < ApplicationController
  # GET /watchlists
  # GET /watchlists.xml
  def index
    @watchlists = Watchlist.all
    respond_with(@watchlists)
  end

  # GET /watchlists/1
  # GET /watchlists/1.xml
  def show
    @watchlist = Watchlist.find(params[:id])
    respond_with(@watchlist)
  end

  # GET /watchlists/new
  # GET /watchlists/new.xml
  def new
    @watchlist = Watchlist.new
    respond_with(@watchlist)
  end

  # GET /watchlists/1/edit
  def edit
    @watchlist = Watchlist.find(params[:id])
  end

  # POST /watchlists
  # POST /watchlists.xml
  def create
    @watchlist = Watchlist.new(params[:watchlist])
    @watchlist.save
    respond_with(@watchlist)
  end

  # PUT /watchlists/1
  # PUT /watchlists/1.xml
  def update
    @watchlist = Watchlist.find(params[:id])
    @watchlist.update_attributes(params[:watchlist])
    respond_with(@watchlist)
  end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.xml
  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    respond_with(@watchlist)
  end
end
