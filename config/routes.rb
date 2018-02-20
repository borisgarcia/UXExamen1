Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'location/index'
    resources :location
    root 'location#index'
end
