Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: %i[ create index destroy]
  
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