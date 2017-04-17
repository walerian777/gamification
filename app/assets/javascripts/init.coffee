window.Application ||= {}

Application.init = ->
  $('a, span, i, div').tooltip()
  base = new Application.Base()
  base.render()

$(document).on 'turbolinks:load', ->
  Application.init()
