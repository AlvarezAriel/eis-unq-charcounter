app = angular.module 'batalla2', []

app.controller 'boardCtrl', ($scope, $http) ->
  $scope.boardSize = [0,0]

  $scope.rows =    ()->  _.range(0,$scope.boardSize[0]).reverse()
  $scope.columns = ()->  _.range(0,$scope.boardSize[1])

  $scope.action = "shoot"

  $scope.cellClicked = (x,y) ->
    $http.put $scope.action, [x,y]
    .success (data) ->
      console.log(data)


  $http.get 'board'
    .success (data) ->
      $scope.boardSize = data.size