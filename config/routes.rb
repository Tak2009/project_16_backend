Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  registrations: 'auth/registrations'
  }
  resources :tickets
  resources :supporters
  resources :pubs

  root 'pubs#index'


end
