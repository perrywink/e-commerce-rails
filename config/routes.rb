Rails.application.routes.draw do

  root to: 'home#index'
  
  post 'items/:id/save_into_list', to: 'items#save_into_list', as: "items_list_save"
  post 'items/:id/remove_from_list', to: 'items#remove_from_list', as: "items_list_remove"
  
  resources :collections
  resources :items
  resources :item_collections, only: [:new, :create, :destroy]
  
end
