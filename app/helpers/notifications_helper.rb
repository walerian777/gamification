module NotificationsHelper
  def notificable_link(notification)
    notificable = notification.notificable
    path = "#{notificable.class.name.downcase}_path"
    link_to(notificable.name, send(path, notificable))
  end
end
