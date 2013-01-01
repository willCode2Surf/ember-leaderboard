App = Ember.Application.create

  ready: ->
    console.log 'created app'

  ApplicationView: require 'views/application_view'
  ApplicationController: require 'controllers/application_controller'

  EditView: require 'views/edit_view'
  EditController: require 'controllers/edit_controller'

  NewView: require 'views/new_view'
  NewController: require 'controllers/new_controller'

  UserView: require 'views/user_view'
  UserController: require 'controllers/user_controller'

  Router: Ember.Router.extend
    enableLogging: true

    home: Ember.Route.transitionTo 'root.index'
    editUser: Ember.Route.transitionTo 'root.users.edit'
    newUser: Ember.Route.transitionTo 'root.users.new'

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

        new: Ember.Route.extend
          route: '/new'

          exit: (router) ->
            console.log 'exiting'
            router.get('applicationController').disconnectOutlet 'manage_users'

          connectOutlets: (router) ->
            router.get('applicationController').connectOutlet 'manage_users', 'new'

        edit: Ember.Route.extend
          route: '/:id/edit'

          exit: (router) ->
            router.get('applicationController').disconnectOutlet 'manage_users'

          deserialize: (router, user) ->
            App.store.find App.User, user.id

          serialize: (router, user) ->
            { id: user.id }

          connectOutlets: (router, user) ->
            router.get('applicationController').connectOutlet 'manage_users', 'edit', user


require('models')(App)

App.store = require 'helpers/store'

module.exports = App
