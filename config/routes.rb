Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  reasources :dogs do
    reasources :fosterings, only: :create
  end
  reasources  :fosterings, only: :delete do
    reasources :reviews, only: :create
  end
  reasources :reviews, only: [:new, :edit, :update]
end
