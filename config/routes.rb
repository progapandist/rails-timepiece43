Rails.application.routes.draw do
  devise_for :users

  resources :watches, only: [ :index ]
  resources :users, only: [ :show, :edit, :update ] do
    resources :watches, only: [ :show, :new, :create, :edit, :update ]
    resources :bookings, only: [ :index, :show, :new, :create ]
  end

  root to: 'watches#index'
  mount Attachinary::Engine => "/attachinary"
end
