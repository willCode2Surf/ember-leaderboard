module.exports = Ember.View.extend
  templateName: 'user'

  isDeleting: false

  plusPosition: (e) ->
    currentPosition = e.context.get 'position'
    e.context.set 'position', currentPosition += 1
    @set 'isDeleting', true

  minusPosition: (e) ->
    currentPosition = e.context.get 'position'
    e.context.set 'position', currentPosition -= 1
    @set 'isDeleting', true

  undo: (e) ->
    App.store.get('defaultTransaction').rollback()
    @set 'isDeleting', false

  save: ->
    App.store.commit(App.User)
    @set 'isDeleting', false

  delete: (e) ->
    @set 'isDeleting', true
    e.context.deleteRecord()
