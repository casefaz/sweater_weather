Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do 
    namespace :v1 do 
      get '/forecast', to: 'forecast#index'
      resources :road_trip, only: [:new, :create]
      resources :users, only: [:new, :create]
      resources :sessions, only: [:new, :create]
    end
  end
end
