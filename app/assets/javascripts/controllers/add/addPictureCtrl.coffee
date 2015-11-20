@cooking.controller 'addPictureCtrl', ($scope,$http,$location,$routeParams) ->
  $scope.addPicture = ->

    file = document.getElementById("file").files[0]
    reader = new FileReader()

    reader.onloadend = -> 
      console.log("mkmlk")
      $scope.pictureUrl = reader.result
      req = $http.post "http://localhost:3000/recipe/"+$routeParams.id+"/picture/add.json", { title: $scope.pictureTitle, description: $scope.pictureDescription, url: $scope.pictureUrl}
      req.success (res) ->
        if(res.success)
          $scope.pictureTitle       = ""
          $scope.pictureDescription = ""
          $scope.pictureUrl         = ""
        else
          alert("error")

    if file
      reader.readAsDataURL(file)
    else
      $scope.pictureUrl = ""

   

  $scope.finishAddingPictures = ->
    $location.path("/addIngredients/"+$routeParams.id)