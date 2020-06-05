class DeliveryFee < ActiveHash::Base
  self.data = [
    {id: 1, delivery_fee: "出品者負担"},
    {id: 2, delivery_fee: "購入者負担"},
  ]
end