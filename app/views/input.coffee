module.exports = Ember.View.extend
  templateName: 'input'
  userName: null
  createUser: (e) ->
    App.store.createRecord App.User, { name: @get('userName'), position: 1 }
    $('.ember-text-field').val ''
    App.store.commit()
