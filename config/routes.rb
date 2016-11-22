Rails.application.routes.draw do
  devise_for :users

  resources :watches, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :users, only: [ :show, :edit, :update ]
  resources :bookings, only: [ :index, :show ]

  root to: 'watches#index'
  mount Attachinary::Engine => "/attachinary"
end
