Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  post "recipe/add" => "recipe#add"
  post "recipe/:id/picture/add" => "picture#add"
  post "recipe/:id/ingredient/add" => "recipe#addIngredient"
  post "ingredient/add" => "ingredient#add"
  get "ingredient/list" => "ingredient#list"
  get "recipe/recipelist" => "recipe#recipelist"
  get "recipe/recipeid/:id" => "recipe#recipeid"
end
