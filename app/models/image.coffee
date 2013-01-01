module.exports = DS.Model.extend
  url: DS.attr 'string'
  user: DS.belongsTo 'App.User',
    embedded: 'load'
