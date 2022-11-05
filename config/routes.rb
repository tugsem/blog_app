Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end

      post '/signup', to: 'authentication#create'
      post '/login', to: 'authentication#login'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "users#index"

  resources :users do
    resources :posts do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  get '/users/:user_id/posts/new', :to => 'posts#new'
  post './users/:user_id/posts', :to => 'posts#create'
end
