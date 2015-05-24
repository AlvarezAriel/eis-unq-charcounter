app = angular.module 'batalla2', []

app.controller 'boardCtrl', ($scope, $http) ->
  $scope.boardSize = [0,0]
  $scope.rows =    ()->  _.range(0,$scope.boardSize[0]).reverse()
  $scope.columns = ()->  _.range(0,$scope.boardSize[1])

  $http.get 'board'
    .success (data) ->
      $scope.boardSize = data.size