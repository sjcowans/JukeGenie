Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/users/:id/requests', to: 'requests#show'
  get '/users/:id/playlists', to: 'playlists#show'
  patch '/dashboard', to: 'users#update'
  get "/users/:id/playlists/suggestions", to: 'playlist_suggestions#index'
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
