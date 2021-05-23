Rails.application.routes.draw do
  get 'registrations/update'
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'
  get 'home/index'
  get 'home/about'
  
  resources :pets
end
