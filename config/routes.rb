Rails.application.routes.draw do
  
  resources :roles do
    get "delete"
  end

  resources :users do
    delete "destroy"
  end
  
	get '/login' => 'sessions#new', :as => 'login'
	delete '/logout' => 'sessions#destroy', :as => 'logout'
	get '/signup' => 'users#new', :as => 'signup'
	resources :sessions, :only => [:new, :create, :destroy]

 	get  'home'  => 'static_pages#home'
	get  'help'  => 'static_pages#help'
	root :to => "static_pages#home"

end