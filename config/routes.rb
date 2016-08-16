Rails.application.routes.draw do
  resources :networks
  resources :network_apis
  get 'comments/edit'
  
  get "network_api/showselected(/:ssid)" => "network_apis#showselected"

  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'pages/about'

  get 'pages/contact'

  get 'pages/resources'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'

  get 'categories/edit'

  get 'categories/show'

  get 'categories/new'

  get 'home/index'
  resources :posts
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
