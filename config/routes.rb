Rails.application.routes.draw do
  root 'pages#index'

  post 'register_interest', to: 'register_interest#create'

  namespace :property_manager do
    get '/dashboard', to: 'dashboard#index'
  end
end
