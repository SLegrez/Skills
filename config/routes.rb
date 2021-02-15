Rails.application.routes.draw do
  root to: redirect("/#{I18n.default_locale}"), as: :redirected_root

  scope "(:locale)", locale: /fr|en/ do
    root to: "pages#home"
    resources :movies do
      resources :reviews, only: [ :new, :create ]
    end
    resources :reviews, only: [ :destroy ]

    get 'api', to: 'pages#api'
    get 'auth_api', to: 'pages#auth_api'
  end
  
end
