Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'about', to: 'static#about'
  resources :measurements
  resources :reviews
  resources :alterations, only:[:new, :create, :update, :show, :edit]
  resources :tailors
  get ':tailors/:id/reviews', to: 'tailors#reviews', as: 'tailor_reviews'
  get ':tailors/:id/alterations', to: 'tailors#alterations', as: 'tailor_alterations'
  resources :clients
  root 'application#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
