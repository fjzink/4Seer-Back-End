Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: [:show]
  end
end
