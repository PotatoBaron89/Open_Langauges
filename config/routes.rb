# == Route Map
#

Rails.application.routes.draw do

  # USERS
  devise_for :users
  resources :users

  # COURSES + CATEGORIES
  resources :organisations
  resources :courses

  # SOCIAL
  resources :likes, only: [ :create, :destroy ]
  resources :wishes, only: [ :create, :destroy ]
  resources :subscribes, only: [ :create, :destroy ]

  # ACCOUNTS
  post '/users/:id/edit', to: 'users#update'
  get '/users/account/:id', to: 'users#account', as: '/users/account/'

  root to: 'static_pages#home'
  get 'static_pages/privacy_policy'
end
