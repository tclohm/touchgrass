Rails.application.routes.draw do
  get "user_verification/show"
  get "user_verification/update"
  get "user_verification/verify_phone"
  get "user_verification/upload_id"
  devise_for :users
  root "home#index"

  resources :pass_rental do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
