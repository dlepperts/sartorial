Rails.application.routes.draw do
  resources :measurements
  resources :reviews
  resources :alterations
  resources :tailors
  get ':tailors/:id/reviews', to: 'tailors#reviews', as: 'tailor_reviews'
  resources :clients
  
end
