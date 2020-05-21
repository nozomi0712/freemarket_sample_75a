Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'
  resources :items
  resources :users
  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'

end
