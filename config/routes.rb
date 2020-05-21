Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }

  root to: 'items#index'
  resources :items
  resources :users
  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'

end
