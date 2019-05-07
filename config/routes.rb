Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/sessions/login', to: 'sessions#create'
  get '/users/:id', to: 'users#show'
  post '/users/signup', to: 'users#create'
  get '/users/new', to: 'users#new'
end
