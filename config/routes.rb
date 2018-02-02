Rails.application.routes.draw do
  resources :wikis
  devise_for :users

  authenticated :user do
   root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
