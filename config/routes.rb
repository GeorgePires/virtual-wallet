Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :users do
    resources :wallets do
      member do
        get '/credit', action: 'credit'
        post '/create_credit', action: 'create_credit'
        
        get '/debit', action: 'debit'
        post '/create_debit', action: 'create_debit'

        get '/transactions', action: 'transactions'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      get '/users/transactions/:id', to: 'users#transactions', as: :transactions

      get '/users/current_balance/:id', to: 'users#current_balance', as: :current_balance
      post 'wallets/credit', to: 'wallets#credit'
      post 'wallets/debit', to: 'wallets#debit'
    end
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
