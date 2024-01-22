Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end

  resources :questions
  resources :answers
end