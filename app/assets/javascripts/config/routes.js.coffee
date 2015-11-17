@cooking.config ( $routeProvider ) ->

  $routeProvider

  .when "/login",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_login.html'

  .when "/register",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_register.html'

  .when "/home",
    templateUrl: 'assets/templates/home/index.html'

  .when "/addRecipe",
    controller:  'addRecipeCtrl'
    templateUrl: 'assets/templates/home/add-recipe.html'

  .when "/addPictures/:id",
    controller:  'addPictureCtrl'
    templateUrl: 'assets/templates/home/add-pictures.html'

  .when "/addIngredients/:id",
    controller:  'addIngredientsCtrl'
    templateUrl: 'assets/templates/home/add-ingredients.html'

  .otherwise redirectTo: "/home"
