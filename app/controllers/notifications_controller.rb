class NotificationsController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def index
    @notifications = current_user.notifications.active.order(created_at: :desc)
    @notifications.update_all(seen: true, updated_at: Time.current)
    @notifications = @notifications.paginate(page: params[:page], per_page: 10)
  end
end
