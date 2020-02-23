Rails.application.routes.draw do

  namespace :admins do
    get 'answers/new'
  end
  get 'inquiries/new'
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
      member do
        get "follow"
        get "follower"
      end
  end

  resources :inquiries

  resources :topicks do
    collection do
      get "about"
    end
    resources :comments
    resource  :likes
  end

  resources :relationships
    resources :genres


  namespace :admins do
    resources :genres
    resources :topicks do
      collection do
      get "top"
      end
    end
    resources :customers
    resources :inquiries
    resources :answers
    resources :update_contacts
  end
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
