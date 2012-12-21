Message = require('message')

class App
  constructor: ->
    message = new Message 'Whats the ETA on those double stuffs?'
    message.send()

module.exports = App
