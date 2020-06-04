Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get '/users/:id/edit', to: 'users#edit'
    patch '/user/:id', to: 'users/registrations#update'
    get 'addresses', to: 'users/registrations#new_address'
    get '/user_addresses/edit', to: 'users/registrations#edit_user_addresses'
    patch '/user_addresses/:id', to: 'users/registrations#update_user_addresses'
    post 'addresses', to: 'users/registrations#create_address'
    post '/user_addresses/:id', to: 'users/registrations#update_user_addresses'
  end
  root to: 'items#index'
  get 'items/purchase/:id', to: 'items#purchase'

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users ,only: [:show]
  resources :categories ,only: [:show] 
end
