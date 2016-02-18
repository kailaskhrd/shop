Rails.application.routes.draw do
  
	get '/login' => 'sessions#new', :as => 'login'
	get '/logout' => 'sessions#destroy', :as => 'logout'
	get '/signup' => 'users#new', :as => 'signup'
	resources :sessions, :only => [:new, :create, :destroy]

  resources :users
  get 'page/index'
  root 'page#index'
end
