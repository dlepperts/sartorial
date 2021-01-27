Rails.application.routes.draw do
  resources :users
  resources :item_types
  resources :measurements
  resources :addresses
  resources :reviews
  resources :alterations, only:[:new, :create, :update, :show, :edit]
  resources :tailors
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
