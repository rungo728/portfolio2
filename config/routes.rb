Rails.application.routes.draw do
  devise_for :users
  # 仮のルーティング
  root 'articles#index'
  resources :tests
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
