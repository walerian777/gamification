class NotificationsController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def index
    @notifications = current_user.notifications.active.order(created_at: :desc)
  end
end
