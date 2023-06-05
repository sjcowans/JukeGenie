Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get 'auth/spotify/callback', to: 'sessions#create'
  resources :users, only: %i[show]
  resources :confirmations, only: %i[create edit], param: :confirmation_token
end
