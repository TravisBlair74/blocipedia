Rails.application.routes.draw do
  resources :charges, only: [:new, :create]

  resources :wikis
  resources :collaborations, only: [:new, :create, :destroy]
  devise_for :users

  authenticated :user do
   root 'wikis#index', as: :authenticated_root
  end

  put '/downgrade', to: 'charges#downgrade'

  root 'welcome#index'
end
