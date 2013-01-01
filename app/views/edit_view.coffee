module.exports = Ember.View.extend
  templateName: 'edit'

  classNames: ['edit-user']

  userName: null

  isEditing: false

  save: ->
    App.store.commit()
    @set 'isEditing', false

  cancel: ->
    App.store.get('defaultTransaction').rollback()
    @set 'isEditing', false

  exit: ->
    App.get('router').transitionTo 'root.index'

  incPosition: (e) ->
    currentPosition = e.context.get 'position'
    @set 'isEditing', true
    e.context.set 'position', currentPosition += 1

  decPosition: (e) ->
    currentPosition = e.context.get 'position'
    @set 'isEditing', true
    e.context.set 'position', currentPosition -= 1

  editUser: (e) ->
    e.context.set 'name', @get 'userName'
    $('.ember-text-field').val ''
    App.store.commit()
