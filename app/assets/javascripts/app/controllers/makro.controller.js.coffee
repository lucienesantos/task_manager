@app.controller 'MakroCtrl', ['$rootScope', '$scope', 'MakroFactory', ($rootScope, $scope, MakroFactory) ->
 
  # create
  $scope.create = (makro) ->
    MakroFactory.create(makro).then (response) ->
      $scope.isOpen = false	
      $rootScope.$broadcast 'nk.default.task.created_makro', response.data
    , (error) ->
      console.error

 ]