app = angular.module 'batalla2', []

app.controller 'boardCtrl', ($scope, $http) ->

  class Cell
    constructor: (@x, @y, @is_ship, @is_hit, @is_sink) ->

  $scope.ships = []
  $scope.game = {board:[[]]}
  $scope.action = "shoot"

  $scope.buildBoard = (w,h)-> ((new Cell(x,y, false, false) for y in [0..(h-1)]) for x in [0..(w-1)])

  $scope.cellClicked = (x,y) ->
    $http.put $scope.action, [x,y]
    .success (data) ->
      $scope.ships = _.map (
        _.flatten _.map data.ships, (s)->
          _.map(s.positions, (c)-> new Cell(c.self[0], c.self[1], true, c.is_hit, _.all(s.positions,(p)->p.is_hit)))
      )
      console.log($scope.ships)
      _.forEach $scope.ships, (cell)-> $scope.game.board[cell.x][cell.y] = cell


  $http.get 'board'
    .success (data) ->
      $scope.game.board = $scope.buildBoard data.size[0], data.size[1]