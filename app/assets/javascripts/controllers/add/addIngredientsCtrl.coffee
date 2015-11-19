@cooking.controller 'addIngredientsCtrl', ($scope,$http,$location,$routeParams) ->
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

  $scope.addIngredient = ->
    $.each $scope.ingredient.selected, (i,ing) ->
      if typeof ing.id == 'undefined'
        reqPush = $http.post "http://localhost:3000/ingredient/add.json", { title: ing.title}
        reqPush.success (data) ->
          ing.id = data.id
          reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: ing.id}
          reqPush.success (data) ->
      else
        reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: ing.id}
        reqPush.success (data) ->              

    