Tobias::Application.routes.draw do
  root :to => "home#index"
  get "about" => "home#about", :as => "about"

  devise_for :users

  resources :users do |user|
    resources :lists, :controller => "users/lists"
    resources :watchlists, :controller => "users/watchlists"
  end

  resources :lists do |list|
    resources :tasks, :controller => "lists/tasks"
    resources :watchlists, :controller => "lists/watchlists"
  end

  resources :tasks
  resources :watchlists
end
