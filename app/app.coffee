App = Ember.Application.create

  ready: ->
    console.log 'created app'

  ApplicationView: require 'views/application_view'
  ApplicationController: require 'controllers/application_controller'

  EditView: require 'views/edit_view'
  EditController: require 'controllers/edit_controller'

  UserView: require 'views/user_view'
  UserController: require 'controllers/user_controller'

  Router: Ember.Router.extend
    enableLogging: true

    editUser: Ember.Route.transitionTo 'root.users.edit'

    root: Ember.Route.extend

      index: Ember.Route.extend
        route: '/',
        enter: Ember.Route.transitionTo 'root.users.index'

      users: Ember.Route.extend
        route: '/users'

        connectOutlets: (router) ->
          users = App.store.findAll App.User
          router.get('applicationController').connectOutlet 'users', 'user', users

        index: Ember.Route.extend
          route: '/'

          connectOutlets: (router) ->
            users = App.store.findAll App.User
            router.get('applicationController').connectOutlet 'users', 'user', users

        edit: Ember.Route.extend
          route: '/:id/edit'

          exit: (router) ->
            router.get('applicationController').disconnectOutlet 'edit'

          deserialize: (router, user) ->
            App.store.find App.User, user.id

          serialize: (router, user) ->
            { id: user.id }

          connectOutlets: (router, user) ->
            router.get('applicationController').connectOutlet 'edit', 'edit', user


require('models')(App)

App.store = require 'helpers/store'

module.exports = App
