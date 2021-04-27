Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/cards', to: 'cards#index'


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'


  root('static#home')
  
  resources :users
  resources :cards do
    get :feed, on: :collection
  end
  resources :decks
  resources :comments

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
