Rails.application.routes.draw do
  resources :vocabularies

  get 'home/index'

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
end
