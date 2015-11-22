@cooking.controller 'editRecipeCtrl', ($scope,$http,$routeParams) ->
  req = $http.get "http://localhost:3000/recipe/recipeid/"+$routeParams.id+".json"
  req.success (data) ->
    console.log(data)
    $scope.recipe = data
  $scope.pictures = []
  $scope.addPicture = ->
    $.each document.getElementById("file").files, (i,file) ->
      reader = new FileReader()
      reader.onloadend = -> 
        console.log("mkmlk")
        $scope.pictureUrl = reader.result
        $scope.pictures.push(reader.result)
        console.log($scope.pictures)
        req = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/picture/add.json", {url: $scope.pictureUrl}
        req.success (res) ->
          if(res.success)
            if i == document.getElementById("file").files.length-1
              document.getElementById("file").value = ""
          else
            alert("error")

      if file
        reader.readAsDataURL(file)
      else
        $scope.pictureUrl = ""
  
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
            console.log(i+"  ==  "+$scope.ingredient.selected.length-1)
            if i == $scope.ingredient.selected.length-1
              $scope.ingredient.selected = []
      else
        reqPush = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/ingredient/add.json", { ingredient_id: ing.id}
        reqPush.success (data) ->
            console.log(i+"  ==  "+$scope.ingredient.selected.length-1)
            if i == $scope.ingredient.selected.length-1
              $scope.ingredient.selected = []

  $scope.delete = ->
    req = $http.get "/recipe/"+$routeParams.id+"/delete"
    req.success (data) ->
      $location.path("/#/home")


