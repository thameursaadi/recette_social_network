@cooking.controller 'RecipeUserCtrl', ($scope,$http,$routeParams) ->
  reqFollowers = $http.get "user/"+$routeParams.id+"/nbrFollowers.json"
  reqFollowers.success (data) ->
    $scope.nombreFollowers = data.n
  reqProfil = $http.get "/user/"+$routeParams.id+".json"
  reqProfil.success (data) ->
    $scope.user = data.email
  req = $http.get "/user/"+$routeParams.id+"/recipes.json"
  $scope.recipes = []
  req.success (data) ->
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

  $scope.follow = () ->
    reqFollow = $http.post "/user/"+$routeParams.id+"/follow.json"
    reqFollow.success ->
