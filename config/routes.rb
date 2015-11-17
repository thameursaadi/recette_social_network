Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  get "recipe/add" => "recipe#add"
  get "recipe/:id/picture/add" => "picture#add"
  get "ingredient/add" => "ingredient#add"
end
