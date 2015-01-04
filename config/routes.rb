Rails.application.routes.draw do
  
  # get 'sessions/new'

  # get 'signup', 	to: 'users#new', 			as: 'signup'
  # get 'signin', 	to: 'sessions#new', 		as: 'signin'
  # get 'logout', 	to: 'sessions#destroy', 	as: 'logout'

  # get 'user',		to: 'users#index'

  # get 'profile',	to: 'users#edit',			as: 'profile'

root 'home#index'
resources :users
resources :sessions
get 'logout', to: 'sessions#destroy', as: 'logout'

end