Rails.application.routes.draw do
  resources :emails, path: :subscriptions, only: [:new, :create, :destroy]

  get "subscribe", to: "messages#subscribe"
  get "unsubscribe", to: "messages#unsubscribe"
  get "order_complete", to: "messages#order_complete"
  
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
