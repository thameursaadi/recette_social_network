@cooking.config ( $routeProvider ) ->

  $routeProvider

  .when "/login",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_login.html'

  .when "/register",
    controller:  'authCtrl'
    templateUrl: 'assets/templates/auth/_register.html'

  .when "/home",
    controller:  'listRecipeCtrl'
    templateUrl: 'assets/templates/recipe/list-recipe.html'

  .when "/addRecipe",
    controller:  'addRecipeCtrl'
    templateUrl: 'assets/templates/add/add-recipe.html'

  .when "/addPictures/:id",
    controller:  'addPictureCtrl'
    templateUrl: 'assets/templates/add/add-pictures.html'

  .when "/addIngredients/:id",
    controller:  'addIngredientsCtrl'
    templateUrl: 'assets/templates/add/add-ingredients.html'

  .otherwise redirectTo: "/home"
