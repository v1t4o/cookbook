Rails.application.routes.draw do
  root to: 'home#index'
  get '/recipes/drafts', to: 'recipes#drafts'
  resources :recipes, only: [:show, :new, :create, :edit, :update, :index] do
    patch :publish, on: :member
    patch :draft, on: :member
  end
  resources :recipe_types, only: [:new, :create]
end
