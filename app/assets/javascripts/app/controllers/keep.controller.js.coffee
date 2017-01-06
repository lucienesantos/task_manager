@app.controller 'KeepOutOfCtrl', ['$rootScope', '$scope', 'KeepFactory', ($rootScope, $scope, KeepFactory) ->
  console.log 'KeepOutOfCtrl'
  $scope.keep;

  $scope.fetch = (scope)->
    KeepFactory.index(scope)

  $scope.destroy = (id) ->
    confirm = window.confirm ('Are you sure?')
    KeepFactory.destroy(id) if confirm

  $scope.justKeepIt = (keep) ->
    KeepFactory.create(keep).then (response) ->
      $rootScope.$broadcast 'nk.default.task.created', response.data
    , (error) ->
      console.error

  # create and start
  $scope.startItNow = (keep) ->
    keep.started = true
    keep.started_at = new Date()

    KeepFactory.create(keep).then (response) ->
      $rootScope.$broadcast 'nk.task.started', response.data
      $scope.keep = {}
    , (error) ->
      console.error;

  $scope.update = (keep) ->
    KeepFactory.update(keep.id, keep)

  $scope.formatDate = (date) ->
    moment(date, "YYYY-MM-DD").fromNow() if date


]