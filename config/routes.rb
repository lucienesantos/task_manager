Rails.application.routes.draw do

  delete '/keeps/remove_many' => 'keeps#destroy_many'

  resources :keeps, except: [:new] do
    post 'start', on: :member, to: 'keeps#start', as: :start
  end
  
  get 'makros/:id', to: 'makros#show', as: :makro
  post 'makros' => 'makros#create'
  get 'makros' => 'makros#index'

  namespace :api do
    resources :keeps, only: [:index]
  end

  root to: 'keeps#index'
end
