Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :fosterings, only: :create
  end
  resources  :fosterings, only: [:delete, :show, :new] do
    resources :reviews, only: :create
  end
  resources :reviews, only: [:new, :update]

  get "/dashboard", to: "pages#dashboard", as: "user_dashboard"
end
