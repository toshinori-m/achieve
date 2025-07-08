Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end
  resources :users
  resources :likes, only: ['destroy']
  resources :goals, only: %w[create index]
  resources :threemonths_goals, only: %w[create index]
  resources :monthly_goals, only: %w[create index]
  resources :reports, only: %w[new create index]
  # resources :guests, only: ['create']
  resources :guests, only: [:create]
  get 'ping', to: 'ping#index'
end
