Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get '/users/:id/edit', to: 'users#edit'
    patch '/user/:id', to: 'users/registrations#update'


    get 'addresses', to: 'users/registrations#new_address'
    get '/user_addresses/:id/edit', to: 'users/registrations#edit_user_addresses'
    patch '/user_addresses/:id', to: 'users/registrations#update_user_addresses'
    post 'addresses', to: 'users/registrations#create_address'
    post '/user_addresses/:id', to: 'users/registrations#update_user_addresses'
  end
  root to: 'items#index'
  get 'items/purchase', to: 'items#purchase'
  resources :items
  resources :users ,only: [:show]
  # あとで確認
  # memberにする
end
