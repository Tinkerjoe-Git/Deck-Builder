Rails.application.routes.draw do


 
  # resources :collections do
  #   resources :cards, only: [:index, :show, :new]
  # end
  resources :cards

  resources :collections do
    resources :cards, only: [:index, :new, :create, :update]
  end
  
  resources :collections

  resources :decks
  
  resources :deck_cards do
    resources :cards
  end
  resources :decks do
    resources :deck_cards, only: [:index, :new, :create]
  end

  resources :users

  

  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/cards', to: 'cards#index'

  post '/decks', to: "decks#create"

  get "/users/:user_id/decks/:id/edit/:page_num", to: "decks#edit"

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/search', to: 'cards#search', as: 'search'


  root('static#home')
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
