Rails.application.routes.draw do
  resources :emails, path: :subscriptions, only: [:new, :create, :destroy]

  resources :orders do
    get "complete"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homepage#index"

  get "thisisvarun", to: "login#new"
  post "thisisvarun", to: "login#create"
end
