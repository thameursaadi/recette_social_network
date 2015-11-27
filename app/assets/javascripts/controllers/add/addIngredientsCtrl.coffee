@cooking.controller 'addIngredientsCtrl', ($scope,Auth,$http,$location,$routeParams) ->
  if ! (Auth.isAuthenticated())
    $location.path("/login")
  req = $http.get "http://localhost:3000/ingredient/list.json"
  $scope.ingredients = []
  req.success (data) ->
    $scope.ingredients = data
    console.log(data)
  $scope.ingredient = {}

  $scope.tagTransform = (newTag) ->
    item = {
      title: newTag,
    }
    return item
  $scope.addedIngredients = []
  $scope.addIngredient = ->
    $.each $scope.ingredient.selected, (i,ing) ->
      if typeof ing.id == 'undefined'
        reqPush = $http.post "http://localhost:3000/ingredient/add.json", { title: ing.title}
        reqPush.success (data) ->
          ing.id = data.id
          reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: ing.id}
          reqPush.success (data) ->
            $scope.addedIngredients.push(ing)
            if i == $scope.ingredient.selected.length-1
              $scope.ingredient.selected = []
            
      else
        reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: ing.id}
        reqPush.success (data) ->
            $scope.addedIngredients.push(ing)
            if i == $scope.ingredient.selected.length-1
              $scope.ingredient.selected = []              

  $scope.finish = ->
    $location.path("/home")