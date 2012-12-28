module.exports = DS.Model.extend
  name: DS.attr 'string'
  position: DS.attr 'number', { defaultValue: 1 }
