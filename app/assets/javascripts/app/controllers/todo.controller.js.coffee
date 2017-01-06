@app.controller 'TodoListCtrl', ['$rootScope', '$scope', ($rootScope, $scope) ->
 
  $scope.fetch('todo').then (response) ->
    $scope.todolist = response.data
  , (error) ->
    console.error error
  
  $scope.removeIt = (keep_id, index) ->
    $scope.destroy(keep_id).then (success) ->
      $scope.todolist.splice(index, 1)
    , (error) ->
      console.error error

  $scope.startIt = (keep, index) ->
    keep.started = true
    keep.started_at = new Date()

    $scope.update(keep).then (response) ->
      $scope.todolist.splice(index, 1)
      $rootScope.$broadcast 'nk.task.started', response.data
    , (error) ->
      console.error error

  $rootScope.$on 'nk.default.task.created', (event, data) ->
    $scope.todolist.unshift data

]