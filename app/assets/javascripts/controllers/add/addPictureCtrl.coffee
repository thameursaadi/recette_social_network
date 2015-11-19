@cooking.controller 'addPictureCtrl', ($scope,$http,$location,$routeParams) ->
  $scope.addPicture = ->
    req = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/picture/add.json", { title: $scope.pictureTitle, description: $scope.pictureDescription, url: $scope.pictureUrl}
    req.success (res) ->
      if(res.success)
        $scope.pictureTitle       = ""
        $scope.pictureDescription = ""
        $scope.pictureUrl         = ""
      else
        alert("error")

  $scope.finishAddingPictures = ->
    $location.path("/addIngredients/"+$routeParams.id)