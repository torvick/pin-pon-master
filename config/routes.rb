Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}

  devise_scope :user do
    authenticated :user do
      root 'games#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end
  end

  resources :games

  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'

end
