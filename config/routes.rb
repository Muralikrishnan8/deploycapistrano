# frozen_string_literal: true
Rails.application.routes.draw do
  # Routes for user signup and user destroy
  resources :users, only: [:create, :destroy]
  resources :sessions, only: [:create]
end
