Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :items
  resources :users
  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'

end
