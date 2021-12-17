Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  
  devise_for :admin_users
  devise_for :users, controllers: {
    invitations: "users/invitations"
  }

  root 'pages#index'

  namespace :admin_users do
    resources :property_managers, only: [:index] do
      collection do
        post 'invite'
      end
    end
  end

  post 'register_interest', to: 'register_interest#create'

  namespace :property_managers do
    get '/dashboard', to: 'dashboard#index'
    get '/estates', to: 'estates#index'
    get '/estates/:id', to: 'estates#show', as: :estate
  end
end
