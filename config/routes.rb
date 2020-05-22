Rails.application.routes.draw do
  root to: 'items#index'
  get 'items/purchase', to: 'items#purchase'
  resources :items
  resources :users
  devise_for :users
  # あとで確認
  # memberにする
  

end
