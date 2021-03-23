Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'students/show'
  devise_for :students, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :students, only: [:show]
  resources :courses
  root 'static_pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
