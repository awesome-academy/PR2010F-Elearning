class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification,counter)
      html = ApplicationController.render(
        partial: 'notifications/notification',
        locals: {notification:notification}
      )
      counter = ApplicationController.render(
        partial: 'notifications/counter',
        locals: {counter:counter}
      )
    ActionCable.server.broadcast "notifications_channel", html: html, counter: counter
  end
end
