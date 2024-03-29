Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                                                      controllers: { sessions: 'users/sessions' }

  resources :feedbacks, only: %i[new create]

  resources :badges, only: :index

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
    resources :gists, only: %i[index destroy]
    resources :badges, except: :show
  end
end
