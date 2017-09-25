Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show ]
  resources :recipes
  resources :sessions, only: [ :new, :create, :delete ]
  post '/reviews' => 'reviews#create'

  #category
  get "/categories/appetizers", to: "categories#appetizers", as: "appetizers"
  get "/categories/salads", to: "categories#salads", as: "salads"
  get "/categories/main-courses", to: "categories#main_courses", as: "main-courses"
  get "/categories/desserts", to: "categories#desserts", as: "desserts"

  # root "users#session"
end
