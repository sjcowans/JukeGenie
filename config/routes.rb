Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  
  get '/dashboard', to: 'users#show', as: :dashboard
  patch '/dashboard', to: 'users#update'
  post '/dashboard', to: 'users#create'
  get '/dashboard/requests', to: 'requests#show'
  resources :users, only: %i[new create]

  scope '/dashboard', as: 'dashboard' do
    resources :playlists, only: [:index, :new, :create, :show] do
      resources :suggestions, only: [:index, :create], controller: 'playlist_suggestions'
    end
  end

  get '/sessions', to: 'sessions#create'
  patch '/sessions', to: 'sessions#update'
  get "/users/:id/playlists/:id/suggestions", to: 'playlist_suggestions#index'
  get '/confirmations/:id', to: 'confirmations#show'
  patch '/users/confirm', to: 'users#confirm_email'
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
