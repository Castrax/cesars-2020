Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :categories do
    resources :winners
  end
  resources :answers do
    get 'voted', to: 'answers#voted'
  end

  devise_for :users
  root to: 'pages#home'
  get "/pages/:page" => "pages#resultats"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
