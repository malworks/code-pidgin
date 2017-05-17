Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/index'

  resources :users, except: [:update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
