Rails.application.routes.draw do
    resources :properties do
    resource :locations
  end

  resources :locations

  resources :profiles

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  resources :users do
      resource :profiles
      resource :location
      resource :properties
  end  
end
