# == Route Map
#

Rails.application.routes.draw do

  resources :organisations
  resources :courses
  devise_for :users
  resources :users

  post '/users/:id/edit', to: 'users#update'


  root to: 'static_pages#home'
  get 'static_pages/privacy_policy'
end
