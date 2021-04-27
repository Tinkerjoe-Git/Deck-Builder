Rails.application.routes.draw do


  resources :users
  resources :cards
  resources :decks
  resources :comments
  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/cards', to: 'cards#index'


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/search', to: 'cards#search', as: 'search'


  root('static#home')
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
