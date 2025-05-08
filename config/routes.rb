Rails.application.routes.draw do
  get "checkout/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'products#index'

  # Checkout route
  # post '/checkout/create', to: 'checkout#create', as: 'checkout_create'

  # Success and Cancel routes
  get '/success', to: 'checkout#success'
  get '/cancel', to: 'checkout#cancel'
end
