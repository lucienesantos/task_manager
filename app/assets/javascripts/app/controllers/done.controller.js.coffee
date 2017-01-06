@app.controller 'GettingThingsDoneCtrl', ['$rootScope', '$scope', ($rootScope, $scope) ->
  
  $scope.fetch('done').then (response) ->
    $scope.done =  response.data
  , (error) ->
    console.error error

  $scope.removeIt = (keep_id, index) ->
    $scope.destroy(keep_id).then (success) ->
      $scope.done.splice(index, 1)
    , (error) ->
      console.error

  $rootScope.$on 'nk.task.completed', (event, data) ->
    $scope.done.unshift(data)
    $scope.done = $scope.done

]