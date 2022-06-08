Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'rules', to: 'pages#rules'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :daily_boosters, only: [:new, :create]
  resources :users, only: [:show]
  resources :user_cards, only: [:index]
  resources :cards, only: [:show, :index]
  resources :games, only: [:new, :create]
  resources :rounds, only: [:show] do
    resources :round_cards, only: [:create]
  end
  get "/next-round/:game_id", to: "rounds#next", as: "next_round"
end
