class Lists::WatchlistsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.save
    flash[:notice] = "You are now watching #{@list.name}"
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @watchlist = Watchlist.find_by_params(watchlist_params)
    @watchlist.destroy
    flash[:notice] = "You stopped watching #{@list.name}"
    redirect_to :back
  end

  protected
    def watchlist_params
      {
        :user_id => current_user.id,
        :list_id => params[:list_id]
      }
    end
end
