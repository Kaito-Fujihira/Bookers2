Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "home/about", to: "homes#about"
  resources :users, only: [:show, :index, :edit,:create,:update]
  resources :books, only: [:show, :index, :edit,:create,:update,:destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
