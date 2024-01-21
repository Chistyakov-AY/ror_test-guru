Rails.application.routes.draw do
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :tests do
    resources :questions, shallow: true
  end

  resources :questions
end