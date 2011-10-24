class HomeController < ApplicationController
  respond_to :js, :only => [:index]

  def index
    @lists = List.publicly_visible.paginate(params[:page])
    respond_with(@lists)
  end

  def about; end
end
