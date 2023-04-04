Rails.application.routes.draw do

  root "tests#index"

  resources :tests, shallow: true do
    resources :questions, except: :index
  end
end
