Rails.application.routes.draw do

  root "tests#index"

  resources :tests, shallow: true do
    post :start, on: :member
    resources :questions, except: :index do
      resources :answers, except: :index
    end
  end

  resources :test_passages, only: %i[ show update ] do
    get :result, on: :member
  end
end
