Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipes, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:new, :create]
end
