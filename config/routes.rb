# == Route Map
#

Rails.application.routes.draw do


  resources :results
  resources :lesson_results
  resources :questions
  resources :quizzes
  resources :flashcard_list
  resources :channels do
    resource :channel_user
    resources :messages
  end

  resources :messages

  resources :words
  resources :flashcards
  resources :lessons do
    post '/register', to: 'lessons#register'
    post '/paid_register', to: 'lessons#paid_register'
    delete'/cancel', to: 'lessons#cancel'
  end

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
