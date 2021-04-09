Rails.application.routes.draw do
  get 'students/show'
  devise_for :students, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :students, only: [:show]
  resources :courses
  resources :categories
  resources :tests
  resources :results
  root 'static_pages#index'

  namespace :admin do
    get '/index', to: 'static_pages#index'
    resources :courses
    resources :categories
    resources :questions
  end

end
