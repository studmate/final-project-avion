Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'
  get 'home/index'
  get 'home/about'
  
  resources :pets
end
