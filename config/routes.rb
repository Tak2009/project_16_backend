Rails.application.routes.draw do
  resources :tickets
  resources :supporters
  resources :pubs

  root 'pubs#index'
end
