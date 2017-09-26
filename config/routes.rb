Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show ]
  resources :recipes
  resources :sessions, only: [ :new, :create ]

  delete '/sessions/' => 'sessions#destroy'

  post '/recipes/:id/reviews' => 'recipes#reviews', as: 'new_review'

  get '/recipes/:id/ingredients' => 'recipes#ingredient'
  post '/recipes/:id/ingredients' => 'recipes#create_ingredients'


  #category
  get "/categories/appetizers", to: "categories#appetizers", as: "appetizers"
  get "/categories/salads", to: "categories#salads", as: "salads"
  get "/categories/main-courses", to: "categories#main_courses", as: "main-courses"
  get "/categories/desserts", to: "categories#desserts", as: "desserts"

  root "recipes#index"
end
