Rails.application.routes.draw do
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #sighup
  post '/signup',to: 'users#create'
  get '/me',to: 'users#show'

  #;login
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'

end
