Rails.application.routes.draw do
  get 'page/index'
  devise_for :users
  root 'pets#index'
  get 'home/index'
  get 'home/about'
  resources :pets
end
