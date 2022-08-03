Rails.application.routes.draw do
  root 'home#index'
  resources :words
  
  
  devise_for :users
  
  get "users", to: "devise/session#new"
  
end
