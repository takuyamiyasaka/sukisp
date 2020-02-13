Rails.application.routes.draw do

  devise_for :admins, controllers:{
  	sessions:       "admins/sessions",
  	passwords:      "admins/passwords",
  	registrations:  "admins/registrations"
  }
  devise_for :customers, controllers:{
  	sessions:       "customers/sessions",
  	passwords:      "customers/passwords",
  	registrations:  "customers/registrations"
  }

  root to: "topicks#top"


  resources :customers do
    collection do
      get "withdraw"
    end
  end
  resources :topicks do
    collection do
      get "about"
    end
    resources :comments
    resource  :likes
  end

  resources :relationships


  namespace :admins do
    resources :genres
    resources :topicks
    resources :customers
  end

  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
