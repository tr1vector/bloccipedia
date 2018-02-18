Rails.application.routes.draw do
  get 'charges/new'

  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'

  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

  resources :collaborators, only: [:new, :create, :update, :destroy]

  devise_for :users
  # get 'welcome/index'

  get 'welcome/about'

  get 'welcome/faq'

  root 'welcome#index'
  
end
