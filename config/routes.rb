Rails.application.routes.draw do
  resources :lists do 
    resources :items 
  end

  #resources :items
  resources :users

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/users/new' => 'users#create'
  root 'lists#index'
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
