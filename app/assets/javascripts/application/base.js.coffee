class Application.Base
  constructor: ->

  render: ->
    $('form[data-remote=true] select').change()
