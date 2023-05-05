Rails.application.routes.draw do
  devise_for :users

  root 'accounts#show'

  resources :accounts, only: :show
  resources :records, only: %i[create destroy]
end
