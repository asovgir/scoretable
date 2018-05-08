Rails.application.routes.draw do
  resources :records
  get 'users/new'
  post 'users/add_loss'
  post 'users/add_victory'


  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "categories#h2h"
  get '/h2h', to: 'categories#h2h'
  get '/categories', to: 'categories#index'
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/records', to: 'records#index'
  get '/profile/:id', to: 'users#profile', as: 'profile'
  post '/profile/:id/add_loss', to: 'users#add_loss'
  post '/profile/:id/add_victory', to: 'users#add_victory'
  post '/signup', to: 'users#create'
  resources :users

end
