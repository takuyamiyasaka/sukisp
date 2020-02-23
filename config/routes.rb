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


  resources :customers  ,only:[:show,:edit,:update,:destroy] do
    collection do
      get "withdraw"
    end
      member do
        get "follow"
        get "follower"
      end
  end

  resources :inquiries ,only: [:new, :create]

  resources :topicks do
    collection do
      get "about"
    end
    resources :comments ,only: [:create, :destroy]
    resource  :likes, only: [:create, :destroy]
  end

  resources :relationships ,only: [:create, :destroy]
  resources :genres ,only: [:index, :show]


  namespace :admins do
    resources :genres ,only:[:index, :create,:update,:edit]
    resources :topicks, only: [:index,:show] do
      collection do
      get "top"
      end
    end
    resources :customers,only: [:index,:show,:edit,:update]
    resources :inquiries ,only:[:show,:edit,:index,:update]
    resources :answers, only:[:create]
    resources :update_contacts ,only: [:create]
  end
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
