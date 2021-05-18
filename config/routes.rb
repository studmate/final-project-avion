Rails.application.routes.draw do
  get 'page/index'
  devise_for :users
  root 'page#index'
  get 'home/index'
  
end
