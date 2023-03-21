Rails.application.routes.draw do

  root "tests#index"

  #delete "/questions/:id", to: "questions#destroy", as: "destroy_question"

  resources :tests do
    resources :questions#, shallow: true
  end
end
