Rails.application.routes.draw do
  root 'home#index'
  devise_for :users 
  # get 'homepage', to: 'home#homepage'
  
end
