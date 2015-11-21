@cooking.controller 'RecipeDetailsCtrl', ($scope,$http,$routeParams) ->
  req = $http.get "http://localhost:3000/recipe/recipeid/"+$routeParams.id+".json"
  req.success (data) ->
    $scope.recipe = data