Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  post "recipe/add" => "recipe#add"
  post "recipe/:id/picture/add" => "picture#add"
  post "recipe/:id/ingredient/add" => "recipe#addIngredient"
  post "ingredient/add" => "ingredient#add"
end
