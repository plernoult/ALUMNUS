Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do 
    resources :favorites, only: [:index, :create, :destroy]
  end
  root to: 'pages#home'
  resources :chatrooms, only: [:new, :index, :show] do
    collection do
      get 'open/:user_id', to: 'chatrooms#open', as: 'open'
    end
    resources :messages, only: :create

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
