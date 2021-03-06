Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  delete '/destroy', to: 'sessions#destroy'
  get '/authorised', to: 'sessions#page_requires_login'

  get '/events', to: 'events#index'
  get '/events/new', to: 'events#new'
  post '/events', to: 'events#create'
  post '/events_ass/:id', to: 'events#create_ass'
  get '/events/accept/:id', to: 'events#accept'
  get '/events/:id', to: 'events#show'
end
