@app.factory 'KeepFactory', ['$http', '$q', ($http, $q) ->
  
  url = '/keeps'

  deferred = $q.defer()

  index = (scope)->
    request = $http(method: 'GET', url: "/api#{url}.json?scope=#{scope}")
    sendRequest(request)

  create = (body) ->
    request = $http(method: 'POST', data: { keep: body }, url: "#{url}.json")
    sendRequest(request)

  update = (id, body) ->
    request = $http(method: 'PUT', data: { keep: body }, url: "#{url}/#{id}.json")
    sendRequest(request)

  destroy = (id) ->
    request = $http(method: 'DELETE', url: "#{url}/#{id}.json")
    sendRequest(request)

  destroy_many = (keepsToRemove) ->
    request = $http(method: 'DELETE', data: {ids: keepsToRemove}, url: "#{url}/remove_many.json")
    sendRequest(request)

  sendRequest = (config) ->
    config.then((response) -> deferred.resolve(response)).catch((error) -> deferred.reject(error))
    config

  index: index
  create: create
  update: update
  destroy: destroy
  destroy_many :destroy_many

]