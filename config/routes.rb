require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#home'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, except: [:show]
  resources :achievements
  resources :achievements_users, only: [:new, :create, :destroy]
  resources :teams
  namespace :leaderboards do
    resource :users, only: [:index]
    resource :teams, only: [:index]
  end

  get 'me', to: 'users#me'
  get '/u(sers)/:nickname', to: 'users#show', as: :show_user, constraints: { nickname: %r{[^\/]+(?=\.html\z|\.json\z)|[^\/]+} }

  resources :charts, only: [] do
    collection do
      get 'points_per_day'
    end
  end

  mount Sidekiq::Web, at: 'jobs'
end
