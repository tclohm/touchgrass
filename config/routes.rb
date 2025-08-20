Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :pass_rental do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
