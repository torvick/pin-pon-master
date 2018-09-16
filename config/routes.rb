Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}

  root 'home#index'

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end
  end

  resources :games
  resources :ratings

  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'

end
