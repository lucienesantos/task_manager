@app = angular.module 'nanokeeps', []

@app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.common['Content-Type'] = 'application/json'

]