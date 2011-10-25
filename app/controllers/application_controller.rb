require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js

  protect_from_forgery

  def paginated_scope(relation)
    instance_variable_set "@#{controller_name}", relation.paginate(params[:page])
  end
  hide_action :paginated_scope
end
