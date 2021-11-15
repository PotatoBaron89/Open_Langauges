# == Route Map
#

Rails.application.routes.draw do

  resources :channels do
    resource :channel_user
    resources :messages
  end
  # get 'definitions/index'
  # get 'definitions/show'
  # get 'definitions/delete'
  # get 'definitions/edit'
  resources :words
  resources :flashcards
  resources :lessons
  resources :definitions

  resources :channels do
    resource :channel_user
  end

  # USERS
  devise_for :users
  resources :users

  # ADMIN
  get '/admin', to: 'admin#dashboard'
  # Roles
  get '/admin/roles', to: 'admin#roles'
  resources :roles

  # COURSES + CATEGORIES
  resources :organisations
  resources :courses
  get '/course/list', to: 'courses#courselist'

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
