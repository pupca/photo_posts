Photos::Application.routes.draw do
  get "photos/new"
  get "photos/show"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :photos do
    collection do
      post :raw_create
    end
  end
end