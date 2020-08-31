Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  
  resources :users, only: [:index, :show, :search] do 
    resources :favorites, only: [:index, :create, :destroy]
  end
  root to: 'users#index'
  resources :chatrooms, only: [:new, :index, :show] do
    collection do
      get 'open/:user_id', to: 'chatrooms#open', as: 'open'
    end
    resources :messages, only: :create
  end

  get '/my_profile', to: 'users#profile', as: 'user_profile'
  get '/users_search', to: "users#search", as: 'user_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
