Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'pets#index'
  get 'home/index'
  get 'home/about'
  get 'page/index'
  
  resources :pets do
    resources :matches, only: %i[index show create destroy] do
      collection do
        get 'accept_match'
        get 'decline_match'
      end
    end
  end
end
