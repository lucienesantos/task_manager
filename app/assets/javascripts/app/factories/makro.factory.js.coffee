@app.factory 'MakroFactory', ['$http', '$q', ($http, $q) ->
  
  url = '/makros'

  deferred = $q.defer()

  index = (scope)->
    request = $http(method: 'GET', url: "#{url}.json")
    sendRequest(request)

  create = (body) ->
    request = $http(method: 'POST', data: { makro: body }, url: "#{url}.json")
    sendRequest(request)

  sendRequest = (config) ->
    config.then((response) -> deferred.resolve(response)).catch((error) -> deferred.reject(error))
    config

  index: index
  create: create

]