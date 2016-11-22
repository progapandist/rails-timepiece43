Rails.application.routes.draw do
  devise_for :users

  resources :bookings, only: [ :show, :index, :create]
  resources :watches, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :bookings, only: [:new]
  end
    resources :users, only: [ :show, :edit, :update ]

  root to: 'watches#index'
  mount Attachinary::Engine => "/attachinary"
end

