Rails.application.routes.draw do
  get 'favorites/api/v1/favorites'
  devise_for :users
  get 'home/index'
  root 'home#index'

  concern :favoritable do |options|
    shallow do
      post '/favorite', { to: 'favoritable#create', on: :member }.merge(options)
      delete '/favorite', { to: 'favorite#destroy' }.merge(options)
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: %i[index show]
      resources :search, only: :index
      resources :albums, only: :show do
        resources :recently_heards, only: :create
      end

      resources :favorites, only: :index

      resources :songs, only: [] do
        concerns :favoritable, favoritable_type: 'Song'
      end
    end
  end
  # constraints para garantir que caso seja adiciona um arquivo e etc, nao seja redirecionado para o home#index
  get "*path", to: "home#index", :constraints => lambda{|req| req.path !~ /\.(png|jpg|js|css|json)$/ }
end
