Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  get 'items/purchase/:id', to: 'items#purchase'
  resources :items do
    
  end
  resources :users
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end
