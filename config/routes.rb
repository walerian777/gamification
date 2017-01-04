Rails.application.routes.draw do
  root 'home#home'

  devise_for :users

  resources :users

  get 'me', to: 'users#me'
end
