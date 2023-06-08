Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  resources :users, only: [] do 
    resources :playlists, only: [:new, :create, :show]
  end
  get '/users/:id/requests', to: 'requests#show'
  get '/users/:id/playlists/:id', to: 'playlists#show'
  get '/users/:id/explorejukes', to: 'explorejukes#show'
  get '/users/:id/jukes', to: 'jukes#index'
  patch '/dashboard', to: 'users#update'

  patch '/sessions', to: 'sessions#update'
  get "/users/:id/playlists/:id/suggestions", to: 'playlist_suggestions#index'
  get '/confirmations/:id', to: 'confirmations#show'
  patch '/users/confirm', to: 'users#confirm_email'
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
