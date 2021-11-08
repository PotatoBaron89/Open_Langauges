# == Route Map
#

Rails.application.routes.draw do

  resources :organisations
  resources :courses
  devise_for :users
  resources :users

  # ACCOUNTS
  post '/users/:id/edit', to: 'users#update'
  get '/users/account/:id', to: 'users#account', as: '/users/account/'

  root to: 'static_pages#home'
  get 'static_pages/privacy_policy'
end
