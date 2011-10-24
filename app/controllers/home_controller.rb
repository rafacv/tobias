class HomeController < ApplicationController
  respond_to :js, :only => [:index]

  def index
    @lists = List.public.page(params[:page].to_i)
    respond_with(@lists)
  end

  def about; end
end
