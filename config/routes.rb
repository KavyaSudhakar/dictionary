Rails.application.routes.draw do
  resources :words
  
  devise_for :users
  root 'home#index'
  get "users", to: "devise/session#new"
  
end
