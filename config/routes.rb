Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'
  get 'home/index'
  get 'home/about'
  
  resources :pets do
    resources :matches do
      collection do
        get 'pet_match'
        get 'accept_match'
        get 'remove_match'
      end
    end
  end
end
