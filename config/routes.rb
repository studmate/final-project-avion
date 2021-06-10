Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'pets#index'
  get 'home/index'
  get 'home/about'
  get 'page/index'
  
  resources :pets do
    resources :matches, only: %i[ index ] do
      collection do
        get 'pet_match'
        get 'accept_match'
        get 'remove_match'
      end
    end
  end
end
