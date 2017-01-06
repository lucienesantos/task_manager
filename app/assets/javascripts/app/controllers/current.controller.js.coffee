@app.controller 'CurrentCtrl', ['$rootScope', '$scope', 'MakroFactory', ($rootScope, $scope, MakroFactory) ->

  $scope.modeDelete = false

  $scope.fetch('current').then (response) ->
    $scope.keeps =  response.data
  , (error) ->
    console.error error

  $scope.init = () ->
    $scope.fetchMakros()

  $scope.fetchMakros = () ->
    MakroFactory.index().then (response) ->
      $scope.makros =  response.data
    , (error) ->
      console.error error

  $scope.removeIt = (keep_id, index) ->
    $scope.destroy(keep_id).then (success) ->
      $scope.keeps.splice(index, 1)
    , (error) ->
      console.error error

  $scope.removeMany = () ->
    keepsToRemove = $scope.keeps.map (keep) -> return keep.id if keep.isMarked
    $scope.destroyMany(keepsToRemove).then (success) ->
      $scope.updateKeepsList()
    , (error) ->
      console.error error

  $scope.finishIt = (keep, index) ->
    keep.completed = true
    keep.completed_at = new Date()
    $scope.update(keep).then (response) ->
      $scope.keeps.splice(index, 1)
      $rootScope.$broadcast 'nk.task.completed', response.data
    , (error) ->
      console.error error

  $scope.clearKeep = () ->
    $scope.keep = {}

   $scope.updateKeepsList = () ->
    keepsToRemove = $scope.keeps.filter (keep) -> return keep if keep.isMarked
    keepsToRemove.forEach (keep) ->
      $scope.keeps.splice($scope.keeps.indexOf(keep), 1)

  $rootScope.$on 'nk.started.task.created', (event, data) ->
    $scope.keeps.unshift data

  $rootScope.$on 'nk.default.task.created', (event, data) ->
    $scope.clearKeep()

  $rootScope.$on 'nk.task.started', (event, data) ->
    $scope.keeps.push data
    $scope.clearKeep()

  $rootScope.$on 'nk.default.task.created_makro', (event, data) ->
    $scope.makros.push data;
    $scope.keep = {} if $scope.keep ==  undefined
    $scope.keep.makro = data

]