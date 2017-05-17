Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/index'

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :sections do
    resources :articles, except: [:index]
  end

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
