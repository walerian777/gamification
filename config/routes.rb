Rails.application.routes.draw do
  root 'home#home'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users
  resources :achievements

  get 'me', to: 'users#me'
end
