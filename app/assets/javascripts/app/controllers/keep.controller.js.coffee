@app.controller 'KeepOutOfCtrl', ['$rootScope', '$scope', 'KeepFactory', ($rootScope, $scope, KeepFactory) ->
  console.log 'KeepOutOfCtrl'
  $scope.keep;

  $scope.fetch = (scope)->
    KeepFactory.index(scope)

  $scope.destroy = (id, successCallback, errorCallback) ->
    $scope.confirmMessage 'Are you sure you want to destroy this keep?', (confirmed) ->
      if confirmed
        KeepFactory.destroy(id).then (success) ->
          swal 'Deleted!', 'Your keep was deleted :(', 'success'
          successCallback(success)
        ,(error) -> errorCallback(error)
      else
        swal 'Cancelled', 'Your keep is safe :)', 'error'

  $scope.destroyMany = (keepsToRemove, successCallback, errorCallback) ->
    $scope.confirmMessage 'Are you sure you want to destroy all these keeps?', (confirmed) ->
      if confirmed
        KeepFactory.destroy_many(keepsToRemove).then (success) ->
          swal 'Deleted!', 'Your keeps were deleteds :(', 'success'
          successCallback(success)
        ,(error) -> errorCallback(error)
      else
        swal 'Cancelled', 'Your keeps are safe :)', 'error'

  $scope.justKeepIt = (keep) ->
    keep.makro_id = keep.makro.id if (keep.makro != undefined)
    KeepFactory.create(keep).then (response) ->
      console.log($scope.keep)
      $rootScope.$broadcast 'nk.default.task.created', response.data
    , (error) ->
      console.error

  # create and start
  $scope.startItNow = (keep) ->
    keep.makro_id = keep.makro.id if (keep.makro != undefined)
    keep.started = true
    keep.started_at = moment().format("YYYY-MM-DD HH:mm:ss")

    KeepFactory.create(keep).then (response) ->
      $scope.keep = {}
      $rootScope.$broadcast 'nk.task.started', response.data
    , (error) ->
      console.error;

  $scope.update = (keep) ->
    KeepFactory.update(keep.id, keep)

  $scope.formatDate = (date) ->
    moment(date, "YYYY-MM-DD HH:mm:ss").fromNow() if date

  $scope.confirmMessage = (text, confirmCallback) ->
    swal {
      title: 'Are you sure?'
      text: text
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: "Yes, I'm sure"
      cancelButtonText: 'No, cancel please!'
      closeOnConfirm: false
      closeOnCancel: false,
      showLoaderOnConfirm: true,
    }, (confirmed) =>
      confirmCallback(confirmed)

]