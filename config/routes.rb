Rails.application.routes.draw do
  root to: "pages#home"

  resources :movies do
    resources :reviews, only: [ :new, :create ]
  end
  
  resources :reviews, only: [ :destroy ]

end
