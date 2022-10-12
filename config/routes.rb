# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # get 'homepage', to: 'home#homepage'
  namespace :admin do
    resources :users do
      get :delete_modal
    end
    resources :products
    resources :categories
    resources :coupons
  end

  namespace :user do
    resources :products, only: [:index]
  end

  resources :invitations
end
