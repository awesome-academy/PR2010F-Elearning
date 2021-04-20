Rails.application.routes.draw do
  get 'students/show'
  devise_for :students, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :students, only: [:show]
  resources :courses
  resources :categories
  resources :tests
  resources :results
  resources :notifications
  root 'static_pages#index'
  # mount ActionCable.server => '/cable'
  namespace :admin do
    get '/index', to: 'static_pages#index'
    resources :courses
    resources :categories
    resources :questions
    resources :students
    resources :search
  end
end
