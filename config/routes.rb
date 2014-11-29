Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'home#index'

  get 'signup', 	to: 'users#new', 			as: 'signup'
  get 'signin', 	to: 'sessions#new', 		as: 'signin'
  get 'logout', 	to: 'sessions#destroy', 	as: 'logout'

  resources :users
  get 'user',		to: 'users#index'

  resources :sessions
  get 'profile',	to: 'users#edit',			as: 'profile'

end
