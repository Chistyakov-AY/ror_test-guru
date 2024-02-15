Rails.application.routes.draw do
  root 'tests#index'
  
  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout,  to: 'sessions#destroy'

  resources :users, only: %i[ create index destroy ]
  resources :sessions, only: :create
  
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  
    member do
      post :start
    end
  end

  resources :questions
  resources :answers

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end