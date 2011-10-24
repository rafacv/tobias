class WatchlistsController < ApplicationController
  def index
    @watchlists = current_user.watchlists.all
    respond_with(@watchlists)
  end

  def create
    watchlist_attrs = {
      :user_id => current_user.id,
      :list_id => params[:list_id]
    }
    @watchlist = Watchlist.new(watchlist_attrs)
    @watchlist.save
    respond_with(@watchlist)
  end

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    respond_with(@watchlist)
  end
end
