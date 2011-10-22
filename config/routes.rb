Tobias::Application.routes.draw do
  root :to => "home#index"

  resources :lists do
    resources :tasks
  end

  devise_for :users, :path_names => {:sign_in => 'login',
             :sign_out => 'logout', :password => 'password',
             :confirmation => 'verification', :unlock => 'unlock',
             :registration => 'register', :sign_up => 'signup'}
end
