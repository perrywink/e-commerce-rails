Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  post 'users/set_subscription', to: 'users#set_subscription', as: 'set_subscription'
  
  get 'profile/', to: 'profile#index', as: 'profile'
  
  post 'home/newsletter', to: 'home#newsletter', as: 'newsletter'
  
  get 'items/save_list', to: 'items#save_list', as: 'saved'
  post 'items/:id/save_into_list', to: 'items#save_into_list', as: 'items_list_save'
  post 'items/:id/remove_from_list', to: 'items#remove_from_list', as: 'items_list_remove'
  
  get 'help_and_support/', to: 'help_and_support#index', as: 'help_and_support'
  
  resources :collections
  resources :items
  resources :order_items
  
  get 'shopping_bags/show'
  post 'shopping_bags/checkout', to: 'shopping_bags#checkout', as: 'checkout'
  resource :shopping_bags, only:[:show]
  
  
  
end
