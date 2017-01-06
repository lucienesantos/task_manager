Rails.application.routes.draw do
  resources :keeps, except: [:new] do
    post 'start', on: :member, to: 'keeps#start', as: :start
  end
  
  get 'makros/:id', to: 'makros#show', as: :makro

  namespace :api do
    resources :keeps, only: [:index]
  end

  root to: 'keeps#index'
end
