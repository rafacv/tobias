class Users::ListsController < ApplicationController
  before_filter :authenticate_user!
  layout 'lists'

  def index
    @lists = current_user.lists.includes(:tasks)
    respond_with(@lists)
  end
end
