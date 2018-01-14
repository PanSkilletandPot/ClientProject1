Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show ]
  resources :recipes
  resources :sessions, only: [ :new, :create ]

  #sessions
  delete '/sessions/' => 'sessions#destroy'

  #reviews
  post '/reviews/:id' => 'reviews#create'

  #recipes
  get '/recipes/:id/ingredients' => 'recipes#ingredient'
  post '/recipes/:id/ingredients' => 'recipes#create_ingredients'
  delete '/ingredients/:id' => 'recipes#destroy_ingredients'


  #category
  get 'recipes/category/:category' => 'recipes#category'
  get 'categories/:category' => 'categories#show'

  root "recipes#index"
end
