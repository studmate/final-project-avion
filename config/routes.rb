Rails.application.routes.draw do
<<<<<<< HEAD
  get 'page/index'
  devise_for :users
  root 'pets#index'
  get 'home/index'
  get 'home/about'
  resources :pets
=======
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'
  get 'home/index'
  get 'home/about'
  
  resources :pets do
    resources :matches, only: %i[index show create destroy] do
      collection do
        get 'accept_match'
        get 'decline_match'
      end
    end
  end
>>>>>>> 5e205c5850634b0f5802bb7ac81280e6dac3235a
end
