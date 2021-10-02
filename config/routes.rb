Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'opinions#index'
  resources :users, only: %i[new create edit update]
  get 'sessions/new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
end
