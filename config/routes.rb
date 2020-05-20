Rails.application.routes.draw do
  devise_for :users
  resource :items

  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'
end
