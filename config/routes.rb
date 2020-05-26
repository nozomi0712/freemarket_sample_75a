Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get '/user_addresses/:id/edit', to: 'users/registrations#edit_user_addresses'
    post '/user_addresses/:id', to: 'users/registrations#update_user_addresses'
  end
  root to: 'items#index'
  get 'items/purchase', to: 'items#purchase'
  resources :items
  resources :users
  # あとで確認
  # memberにする
end
