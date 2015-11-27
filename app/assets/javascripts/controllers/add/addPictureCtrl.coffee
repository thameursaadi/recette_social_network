@cooking.controller 'addPictureCtrl', ($scope,$http,Auth,$location,$routeParams) ->
  if ! (Auth.isAuthenticated())
    $location.path("/login")
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

   

  $scope.finishAddingPictures = ->
    $location.path("/addIngredients/"+$routeParams.id)