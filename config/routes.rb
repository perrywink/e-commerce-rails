Rails.application.routes.draw do

  get 'shopping_bags/show'
  devise_for :users
  root to: 'home#index'
  post 'home/newsletter', to: 'home#newsletter', as: 'newsletter'
  
  get 'items/save_list', to: 'items#save_list', as: 'saved'
  post 'items/:id/save_into_list', to: 'items#save_into_list', as: 'items_list_save'
  post 'items/:id/remove_from_list', to: 'items#remove_from_list', as: 'items_list_remove'
  
  get 'help_and_support/', to: 'help_and_support#index', as: 'help_and_support'
  
  resources :collections
  resources :items
  resources :item_collections, only: [:new, :create, :destroy]
  resources :order_items
  resource :shopping_bags, only:[:show]
  
end
