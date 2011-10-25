class Users::WatchlistsController < ApplicationController
  layout 'lists'

  def index
    @lists = current_user.watchedlists.all
    respond_with(@lists, :template => "users/lists/index")
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
