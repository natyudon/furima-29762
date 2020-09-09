Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create,:show,:edit] do
    resources :orders, only: :index
  end
end
