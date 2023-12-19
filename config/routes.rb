Rails.application.routes.draw do
  get "/up", to: Proc.new { [200, {}, ["OK"]] }
  
  resources :emails, path: :subscriptions, except: %i[edit update] do
    get "unsubscribe", on: :member
  end

  get "subscribe", to: "messages#subscribe"
  get "unsubscribe_successful", to: "messages#unsubscribe_successful"
  get "order_complete", to: "messages#order_complete"
  
  resources :batches, only: [:new, :create]
  
  resources :orders do
    get "complete"
    patch "fulfill", on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homepage#index"

  get "thisisvarun", to: "login#new"
  post "thisisvarun", to: "login#create"
end
