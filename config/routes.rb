Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  # For details on the
  #  DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'users#index'
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get '/home' => 'home#index'
    end
  end
end
