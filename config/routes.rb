Rails.application.routes.draw do
  get 'users/new'

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "categories#h2h"
  get '/h2h', to: 'categories#h2h'
  get '/categories', to: 'categories#index'
  get '/signup', to: 'users#new'

end
