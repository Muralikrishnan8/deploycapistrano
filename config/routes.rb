# frozen_string_literal: true
Rails.application.routes.draw do
  # Routes for user signup and user destroy
  resources :users, only: [:create, :destroy]
  post    'users/sign_in' => 'sessions#create'
  delete  'users/sign_out' => 'sessions#destroy'
end
