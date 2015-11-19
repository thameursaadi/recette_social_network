@cooking.controller 'listRecipeCtrl', ($scope,$http) ->
  req = $http.get "http://localhost:3000/recipe/recipelist.json"
  $scope.recipes = []
  req.success (data) ->
    $scope.recipes = data
    console.log(data)