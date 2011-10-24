Tobias::Application.routes.draw do
  root :to => "home#index"
  get "about" => "home#about", :as => "about"

  resources :lists do
    resources :tasks
  end

  devise_for :users
end
