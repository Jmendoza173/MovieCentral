Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index,:show,:create]
      resources :users
      resources :list_items
      resources :lists
      resources :replies
      resources :discussions
      resources :ratings
      resources :login, only: [:index, :create]
    end
  end

  # get '/persist', to: 'auth#persist'
  # post '/login', to: 'auth#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
