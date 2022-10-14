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
    resources :orders, only: %i[index]
  end

  namespace :user do
    resources :products, only: %i[index]
    # since this cart is belongs to user and a user can only have a single cart so it should be resouce not resouces
    # as we do not have to pass any id to it, we can get the cart per user by using current_user.ensure_cart
    resource :cart, only: %i[show destroy]
    resources :order_items, only: %i[new create show destroy]
    resources :orders
  end

  resources :invitations
end
