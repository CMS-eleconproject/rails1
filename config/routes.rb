# config/routes.rb
Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  resources :items, only: [:index, :show]
  root 'items#index'
end
