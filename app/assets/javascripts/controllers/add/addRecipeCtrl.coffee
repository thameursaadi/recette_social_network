@cooking.controller 'addRecipeCtrl', ($scope,Auth,$http,$location) ->
  console.log(Auth)
  if ! (Auth.isAuthenticated())
    $location.path("/login")
  $scope.addRecipe = ->
    req = $http.post "http://localhost:3000/recipe/add.json", { title: $scope.recipeName, description: $scope.recipeDescription}
    req.success (res) ->
      if res.success == true
        $location.path("/addPictures/"+res.id)
      else
        alert("error")

 



