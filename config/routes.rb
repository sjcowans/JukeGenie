Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/users/:id/requests', to: 'requests#show'
  get '/users/:id/playlists', to: 'playlists#show'
  get '/users/:id/explorejukes', to: 'explorejukes#show'
  get '/users/:id/jukes', to: 'jukes#index'
  patch '/dashboard', to: 'users#update'
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
