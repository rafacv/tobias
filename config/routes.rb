Tobias::Application.routes.draw do
  root :to => "home#index"

  resources :lists do
    resources :tasks
  end

  devise_for :users
end
