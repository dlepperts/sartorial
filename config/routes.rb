Rails.application.routes.draw do

  root to: 'static#home'

  #user
  resources :users
  get 'orders', to: 'users#orders'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/welcome', to: 'users#welcome'
  post '/welcome', to: 'users#edit'
  get '/welcome_client', to: 'users#welcome_client'
  post '/welcome_client', to: 'users#welcome_client'
  get '/welcome_tailor', to: 'users#welcome_tailor'
  post '/welcome_tailor', to: 'users#welcome_tailor'
  

  #login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #tailor
  resources :tailors
  resources :reviews
  get ':tailors/:id/reviews', to: 'tailors#reviews', as: 'tailor_reviews'
  get ':tailors/:id/alterations', to: 'tailors#alterations', as: 'tailor_alterations'
  

  #alterations
  resources :alterations

  #client
  resources :clients
  resources :measurements

  #static
  get 'home', to: 'static#home'
  get 'about', to: 'static#about'


end
