Rails.application.routes.draw do
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'students/show'
  devise_for :students, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :students, only: [:show]
  resources :courses
  root 'static_pages#index'
  namespace :admin do
  resources :categories, only: [:new, :create]
  end
end
