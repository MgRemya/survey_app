Rails.application.routes.draw do
  namespace :admin do
    get 'users/upload_form'
    post 'users/upload_csv'
    get 'dashboard/index'
    resources :surveys do
      resources :categories do
        resources :questions
      end
    end
  end
  get 'dashboard/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "sessions#new"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "dashboard#index"


  # Defines the root path route ("/")
  # root "posts#index"
end
