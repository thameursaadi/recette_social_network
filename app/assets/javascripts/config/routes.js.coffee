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

  .when "/followed",
    controller:  'RecipeFollowed'
    templateUrl: 'assets/templates/recipe/followed.html'

  .when "/user/:id",
    controller:  'RecipeUserCtrl'
    templateUrl: 'assets/templates/recipe/profil.html'

  .when "/recipe/:id",
    controller: 'RecipeDetailsCtrl'
    templateUrl: 'assets/templates/recipe/details-recipe.html'
  
  .when "/recipe/:id/edit",
    controller: 'editRecipeCtrl'
    templateUrl: 'assets/templates/recipe/edit-recipe.html'

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
