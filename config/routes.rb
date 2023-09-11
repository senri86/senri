Rails.application.routes.draw do
  resources :menus
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus do
    resources :likes, only: [:create, :destroy]
  end
  root 'menus#index'

end
