class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    notification = Notification.find(notification_id)
    counter = notification.user.notifications_count
    ActionCable.server.broadcast("activity_channel_#{notification.user_id}", message: render_notification(notification), counter: render_counter(counter))
  end

  private

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'notifications/counter', locals: { counter: counter })
  end
end
