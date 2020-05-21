Rails.application.routes.draw do

  root to: 'items#index'
  resources :items
  resources :users
  devise_for :users
  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'

end
