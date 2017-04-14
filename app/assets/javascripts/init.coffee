window.Application ||= {}

Application.init = ->
  $('a, span, i, div').tooltip()

  $(document).on 'turbolinks:load', ->
    Application.init()
