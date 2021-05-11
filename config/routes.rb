Rails.application.routes.draw do

  root to: 'home#index'
  
  resources :collections
  resources :items
  resources :item_collections, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
