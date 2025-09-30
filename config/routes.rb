Rails.application.routes.draw do
  root "surveys#index"

  resources :surveys, only: [ :index, :show, :new, :create ] do
    resources :responses, only: :create
  end
end
