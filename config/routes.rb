Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
