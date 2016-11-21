Rails.application.routes.draw do
  devise_for :users

  resources :watches, only: [ :index, :show, :create, :new, :edit, :update ]
  resources :users, only: [ :show, :edit, :update ] do
    resources :watches, only: [ :index ]
    resources :bookings, only: [ :index, :show ]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
