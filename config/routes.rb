Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :watches, only: [ :index ]
  resources :users, only: [ :show, :edit, :update ] do
    resources :watches, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :bookings, only: [ :index, :show ]
  end

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
end
