Rails.application.routes.draw do
  root 'lives#index'

  devise_for :users

  resources :lives, except: %i[show destroy]
  resources :votes, only: %i[create destroy]
end
