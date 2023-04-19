Rails.application.routes.draw do
  root 'tests#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: %i[new create]

  resource :session, only: %i[create destroy]

  resources :tests, shallow: true do
    post :start, on: :member
    resources :questions, except: :index do
      resources :answers, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
