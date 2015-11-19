@cooking.controller 'addIngredientsCtrl', ($scope,$http,$location,$routeParams) ->
  req = $http.get "http://localhost:3000/ingredient/list.json"
  $scope.ingredients = []
  req.success (data) ->
    $scope.ingredients = data
    console.log(data)
  $scope.ingredient = {}
  $scope.addAnotherIngredient = ->
    reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: $scope.ingredient.selected.id}
    reqPush.success (data) ->
      alert("ok")
  $scope.finish = ->
    $location.path("/showRecipe/"+$routeParams.id)