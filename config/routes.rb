Rails.application.routes.draw do
  resources :users do
    resources :wallets do
      collection do
        get "/credit", action: 'credit'
        post '/create_credit', action: 'create_credit'
        
        get "/debit", action: 'debit'
        post '/create_debit', action: 'create_debit'
      end
    end
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
