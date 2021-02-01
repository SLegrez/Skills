Rails.application.routes.draw do
  root to: "pages#home"
  # get "movies", to: "movies#index"
  # get "movies/new", to: "movies#new"
  # post "movies", to: "movies#create"
  # get "movies/:id", to: "movies#show", as: :movie
  # get "movies/:id/edit", to: "movies#edit"
  # patch "movies/:id", to: "movies#update"
  # delete "movies/:id", to: "movies#destroy"

  resources :movies
end
