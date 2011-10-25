class ListsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :js, :only => [:index]

  def index
    @lists = List.publicly_visible.paginate(params[:page])
    respond_with(@lists)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def create
    @list = current_user.lists.build(params[:list])
    @list.save
    respond_with(@list)
  end

  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(@list)
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    respond_with(@list)
  end
end
