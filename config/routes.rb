Rails.application.routes.draw do
  devise_for :users

  root 'accounts#show'

  resources :accounts, except: :index
  resources :records, except: :index
end
