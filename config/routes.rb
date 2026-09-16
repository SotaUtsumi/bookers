Rails.application.routes.draw do

  root 'reviews#index'
  resources :reviews

  get "up" => "rails/health#show", as: :rails_health_check
end
