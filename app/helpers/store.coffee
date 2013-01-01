module.exports = DS.Store.create
  revision: 11
  adapter: DS.RESTAdapter.create
    ajax: (url, type, hash) ->
      hash.url = url
      hash.type = type
      hash.dataType = 'json'
      if type is 'PUT' or type is 'POST'
        hash.contentType = 'application/json; charset=utf-8'
      hash.context = this
      if hash.data and type isnt 'GET'
        hash.data = JSON.stringify(hash.data)
      jQuery.ajax(hash)
