Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users

  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  get 'users/:id/acount', to: 'users#acount', as: 'user_acount'
  get 'users/:id/acount_edit', to: 'users#acount_edit', as: 'user_acount_edit'

  namespace :rooms do
    resources :searches, only: :index
  end
  resources :rooms

end
