Rails.application.routes.draw do
  resource :items

  # あとで確認
  # memberにする
  get 'items/purchase', to: 'items#purchase'
end
