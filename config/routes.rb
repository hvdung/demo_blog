Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/show'

  root 'pages#home'
  get "signup" => 'users#new'
  post "signup" => 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :votes, only: [:create, :destroy]
  end


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy, :show, :index]
  resources :relationships,       only: [:create, :destroy]
  resources :comments,  only:[:create, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
