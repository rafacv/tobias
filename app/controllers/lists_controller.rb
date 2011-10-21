class ListsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /lists
  # GET /lists.xml
  def index
    @lists = List.all
    respond_with(@lists)
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  # GET /lists/new
  # GET /lists/new.xml
  def new
    @list = current_user.lists.new
    respond_with(@list)
  end

  # GET /lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
  end

  # POST /lists
  # POST /lists.xml
  def create
    @list = current_user.lists.build(params[:list])
    @list.save
    respond_with(@list)
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(@list)
  end

  # DELETE /lists/1
  # DELETE /lists/1.xml
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    respond_with(@list)
  end
end
