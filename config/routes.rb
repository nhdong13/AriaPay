Rails.application.routes.draw do
  root 'pages#index'

  post 'register_interest', to: 'register_interest#create'
end
