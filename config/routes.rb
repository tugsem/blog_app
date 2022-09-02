Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, :path_names => { :sign_up => "register",
    :sign_in => "login",
    :sign_out => "logout",
    :settings => "settings" }

  devise_scope :user do
  get "login", :to => "users/sessions#new"
  get "register", :to => "users/registrations#new"
  get "settings", :to => "users/registrations#edit"
  get "logout",   :to => "users/sessions#destroy"

  end

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  get '/users/:user_id/posts/new', :to => 'posts#new'
  post './users/:user_id/posts', :to => 'posts#create'

  # Defines the root path route ("/")
  root "users#index"
end
