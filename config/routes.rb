Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/gifs', to: 'gifs#index'
      post '/sessions', to: 'sessions#create'
      resources :users, only: [:create]
    end
  end
end
