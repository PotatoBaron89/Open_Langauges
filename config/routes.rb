# == Route Map
#

Rails.application.routes.draw do
  resources :courses
  devise_for :users


  root to: 'static_pages#home'
  get 'static_pages/privacy_policy'
end
