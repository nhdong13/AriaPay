Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  
  devise_for :admin_users
  devise_for :users
  root 'pages#index'

  namespace :admin_users do
    get '/property_managers', to: 'property_managers#index'
  end

  post 'register_interest', to: 'register_interest#create'

  namespace :property_manager do
    get '/dashboard', to: 'dashboard#index'
  end
end
