Rails.application.routes.draw do

  namespace :admins do
    get 'genres/index'
  end

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

  resources :topicks do
    collection do
      get "about"
    end
  end

  resources :customers

  namespace :admins do
    resources :genres
  end

  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
