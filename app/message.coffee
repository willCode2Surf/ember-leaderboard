class Message
  constructor: (msg) ->
    @msg = msg

  send: ->
    console.log @msg

module.exports = Message
