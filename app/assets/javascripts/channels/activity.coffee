App.activity = App.cable.subscriptions.create 'ActivityChannel',
  connected: ->

  disconnected: ->

  received: (notification) ->
    $('#notifications').prepend(notification.message)
    $('#notifications_counter').html(notification.counter)
