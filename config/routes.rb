Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # get :logout,  to: 'sessions#destroy'

  # resources :users, only: %i[ new create index destroy ]
  # resources :sessions, only: %i[ new create ]
  
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