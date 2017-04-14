class Application.Users
  constructor: ->

  render: ->
    $('li.active a').click()
    $('.profile-usermenu a').on('click', @onSidebarLinkClick)

  onSidebarLinkClick: (event) ->
    $target = $(event.target)
    $('.profile-usermenu li').removeClass('active')
    $target.parent('li').addClass('active')

$(document).on 'turbolinks:load', ->
  return unless $('.users.show').length > 0
  users = new Application.Users()
  users.render()
