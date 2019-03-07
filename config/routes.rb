Rails.application.routes.draw do
  get 'transactions/new'

  get 'carts/show'

  devise_for :users, path_name: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'movies#index'
  resources :movies, only: [:show, :index]

  resource :cart, only: [:show] do
    put 'add/:movie_id', to: 'carts#add', as: :add_to
    put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
  end

  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
