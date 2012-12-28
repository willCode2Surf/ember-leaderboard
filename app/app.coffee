App = Ember.Application.create

  ready: ->
    console.log 'created app'

  ApplicationView: require 'views/application_view'
  ApplicationController: require 'controllers/application_controller'

  InputView: require 'views/input'
  InputController: require 'controllers/input'

  UserView: require 'views/user_view'
  UserController: require 'controllers/user_controller'

  Router: Ember.Router.extend
    enableLogging: true
    root: Ember.Route.extend
      index: Ember.Route.extend
        route: '/',
        connectOutlets: (router, context) ->
          users = App.store.findAll App.User
          router.get('applicationController').connectOutlet 'users', 'user', users
          router.get('applicationController').connectOutlet 'input', 'input'

require('models')(App)

App.store = require 'helpers/store'

module.exports = App
