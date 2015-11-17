@cooking.controller 'addPictureCtrl', ($scope,$http,$location,$routeParams) ->
  $scope.addPicture = ->
    req = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/picture/add.json", params: { title: "$scope.pictureTitle", description: $scope.pictureDescription, url: $scope.pictureUrl}
    req.success (res) ->
      if(res.success)
        $scope.pictureDescription = ""
        $scope.pictureDescription = ""
        $scope.pictureUrl         = ""
      else
        alert("error")

  $scope.finishAddingPictures = ->
    $location.path("/addIngredients/"+$routeParams.id)