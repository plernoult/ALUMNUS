Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
