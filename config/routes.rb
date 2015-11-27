Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  post "recipe/add" => "recipe#add"
  post "recipe/:id/picture/add" => "picture#add"
  post "recipe/:recipe_id/picture/delete" => "picture#delete"
  post "recipe/:id/ingredient/add" => "recipe#addIngredient"
  post "recipe/:id/ingredient/delete" => "recipe#deleteIngredient"
  post "recipe/:id/rate/add" => "rate#add"
  post "ingredient/add" => "ingredient#add"
  get  "recipe/:id/delete" => "recipe#delete"
  post  "recipe/:id/update" => "recipe#update"
  get "ingredient/list" => "ingredient#list"
  get "recipe/recipelist" => "recipe#recipelist"
  get "recipe/recipeid/:id" => "recipe#recipeid"
  get "user/:id/recipes" => "recipe#recipeuser"
  get "user/:id" => "profil#get"
  post "user/:id/follow" => "profil#follow"
  get "user/:id/nbrFollowers" => "profil#nombreFollowers"
  get "followed" => "profil#followed"
end
