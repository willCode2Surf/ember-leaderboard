module.exports = Ember.View.extend
  templateName: 'new'

  userName: null

  position: null

  cancel: ->
    App.get('router').transitionTo 'root.index'

  newUser: (e) ->
    App.store.createRecord App.User,
      name: @get 'userName'
      position: @get 'position'
    App.store.commit()
    App.get('router').transitionTo 'root.index'
