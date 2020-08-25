Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'pages#home'
  resources :chatrooms, only: [:new, :index, :show] do
    collection do
      get 'open/:user_id', to: 'chatrooms#open', as: 'open'
    end
    resources :messages, only: :create

  end
  get '/users/:id/favorites', to: 'favorites#index', as: 'favorites_users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
