app = angular.module 'batalla2', []

app.controller 'boardCtrl', ($scope) ->
  $scope.boardSize = 5
  $scope.rows =    ()->  _.range(0,$scope.boardSize).reverse()
  $scope.columns = ()->  _.range(0,$scope.boardSize)