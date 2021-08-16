Rails.application.routes.draw do
 
  # devise_for :users
  # get 'products/index'
  # get 'products/show'
  # get 'products/edit'
  # get 'products/new'
  # get 'products/create'
  # get 'products/update'
  # get 'products/destroy'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "review/:id", to: "reviews#create", as: :reviews_create
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  devise_scope :user do
    root to: 'users/sessions#new'
    get "signup", :to => "users/registrations#new"
    get 'verify', to: "users/registrations#verify"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end
end
