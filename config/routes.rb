Rails.application.routes.draw do
  resources :users
  resources :items
  devise_for :users

  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'
end
