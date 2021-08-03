 Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:update, :destroy, :edit]
  resources :doghomes, only: [:index, :show]
  resources :doghomes do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
