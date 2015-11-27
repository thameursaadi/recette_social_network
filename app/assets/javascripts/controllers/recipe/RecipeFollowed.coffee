@cooking.controller 'RecipeFollowed', ($scope,$http) ->
  req = $http.get "/followed.json"
  $scope.recipes = []
  req.success (data) ->
    console.log(data)
    $scope.recipes = data
    $.each $scope.recipes, (index,recipe) ->
      s = 0.0
      $.each recipe.rates, (i,d) ->
        console.log(d.value)
        s = parseFloat(s)+parseFloat(d.value)
      $scope.recipes[index].rate_value = parseFloat(s)/parseFloat(recipe.rates.length)
  
  $scope.addRate = (recipe) ->
    reqRate = $http.post "/recipe/"+recipe.id+"/rate/add.json",{ value:recipe.rate_value }
    reqRate.success (data) ->

	