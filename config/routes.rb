Rails.application.routes.draw do
  # Possibly keep... possibly mock home page for now
  root 'welcome#index'
  get 'about', to: 'welcome#about'

  # Users routes
  get 'signup',  to: 'users#new'
  resources :users, except: [:new]

  #log in and out routes
  get 'login', to: 'session#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  #Properties routes
  resources :properties

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
