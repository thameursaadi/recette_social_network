@cooking.controller 'RecipeDetailsCtrl', ($scope,$http,$routeParams) ->
  req = $http.get "/recipe/recipeid/"+$routeParams.id+".json"
  req.success (data) ->
    $scope.recipe = data
    s = 0.0
    $.each $scope.recipe.rates, (i,d) ->
      console.log(d.value)
      s = parseFloat(s)+parseFloat(d.value)
    $scope.rates = []
    $scope.rate_value = parseFloat(s)/parseFloat($scope.recipe.rates.length)
  
  $scope.addRate = ->
    reqRate = $http.post "/recipe/"+$routeParams.id+"/rate/add.json",{ value:$scope.rate_value }
    reqRate.success (data) ->
      req2 = $http.get "/recipe/recipeid/"+$routeParams.id+".json"
      req2.success (recipeData) ->
        console.log(recipeData)
        $scope.recipe = recipeData
        s = 0.0
        $.each recipeData.rates, (i,d) ->
          s = parseFloat(s)+parseFloat(d.value)
        $scope.rate = parseFloat(s)/parseFloat(recipeData.rates.length)
  