Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # get :logout,  to: 'sessions#destroy'

  # resources :users, only: %i[ new create index destroy ]
  # resources :sessions, only: %i[ new create ]
  
  resources :tests, only: :index do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    # resources :tests, only: :index do
    #   member do
    #     post :start
    #   end
    # end
  
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

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end