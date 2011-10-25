Tobias::Application.routes.draw do
  root :to => "home#index"
  get "about" => "home#about", :as => "about"

  devise_for :users

  resources :lists

  resource :user do
    resources :lists, :controller => "users/lists"
    resources :watchlists, :controller => "users/watchlists",
                           :only => [:index, :create, :destroy]
  end
end
