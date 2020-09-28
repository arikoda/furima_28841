Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :items  do
    resources :orders, only: [:create, :index]
    collection do
      get 'search' 
    end
  end
end
