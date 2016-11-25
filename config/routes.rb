Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :watches, only: [ :index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :users, only: [ :show, :edit, :update ]
  resources :reviews, only: :index
  resources :bookings, only: [ :index, :show ] do
    resources :reviews, only: [ :new, :create ]
  end

  get '/dashboard' => 'bookings#dashboard'
  get '/bookings/:id/accept' => 'bookings#accepted', as: 'accept_booking'
  get '/bookings/:id/reject' => 'bookings#rejected', as: 'reject_booking'
  get 'watches/:id/delete' => 'watches#hide', as: 'hide_watch'

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
end
