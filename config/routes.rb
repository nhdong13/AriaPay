Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  
  devise_for :admin_users
  devise_for :users
  root 'pages#index'

  namespace :admin_users do
    resources :property_managers, only: [:index]
  end

  post 'register_interest', to: 'register_interest#create'

  namespace :property_managers do
    get '/dashboard', to: 'dashboard#index'
  end
end
