Rails.application.routes.draw do
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
