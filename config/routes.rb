Rails.application.routes.draw do
  devise_for :users

  resources :watches, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :users, only: [ :show, :edit, :update ]
  resources :bookings, only: [ :index, :show ]

  get '/owner-bookings' => 'bookings#owner_index'
  get '/bookings/:id/accept' => 'bookings#accepted', as: 'accept_booking'
  get '/bookings/:id/reject' => 'bookings#rejected', as: 'reject_booking'

  root to: 'watches#index'
  mount Attachinary::Engine => "/attachinary"
end

