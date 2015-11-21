@cooking.controller 'RecipeUserCtrl', ($scope,$http,$routeParams) ->
  req = $http.get "http://localhost:3000/user/"+$routeParams.id+"/recipes.json"
  $scope.recipes = []
  req.success (data) ->
    $scope.recipes = data
    console.log(data)