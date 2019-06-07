# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lives#index'

  devise_for :users

  resources :lives, except: %i[show]
  resources :votes, only: %i[create destroy]
end
