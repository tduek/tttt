Demo::Application.routes.draw do

  get "sessions/new"
  root to: 'users#index'
  resources :users, only: [:index, :show, :new, :create]

  resource :session, only: [:create, :destroy]

  get 'auth/facebook/callback', to: 'sessions#create'
end
