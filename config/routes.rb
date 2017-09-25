Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show ]
  resources :recipes
  resources :sessions, only: [ :new, :create, :delete ]
  post '/reviews' => 'reviews#create'

  root "users#session"
end
