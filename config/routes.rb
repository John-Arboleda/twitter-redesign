Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'opinions#index'
  resources :users, only: %i[new create edit update]
  resources :opinions, only: [:index, :create] do
  	resources :comments, only: [:create]
  end
  get 'sessions/new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  post 'follow', to: 'followings#create'
  get 'users/:username', to: 'users#show', as: 'profile'
end
