Rails.application.routes.draw do
  resources :orders
  resources :members
  resources :items
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  # For details on the
  #  DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'users#index'
  get '/qr_pdf' => 'items#qr_pdf'
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get '/home' => 'home#index'
      resources :items
      resources :orders
      resources :tasks do
        collection do
          get 'by_date/:date' => 'tasks#by_date'
        end
      end
      resources :members do
        member do
          get '/validate' => 'members#validate'
        end
      end
      resources :booked_orders
    end
  end
end
