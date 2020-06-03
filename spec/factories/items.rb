FactoryBot.define do
  factory :item do
    item_name         {"バッグ"}
    explanation       {"バッグです"}
    images_attributes {[]}
    price             {5000}
    brand_id          {1}
    condition_id      {1}
    user             
    ship_date_id      {1}
    delivery_fee_id   {1}
    category
    status            {1}
    after( :build ) do |item|
      item.images << FactoryBot.build(:image)
    end
  end
  
  factory :item_no_image, class: Item do
    item_name         {"バッグ"}
    explanation       {"バッグです"}
    images_attributes {[]}
    price             {5000}
    brand_id          {1}
    condition_id      {1}
    user             
    ship_date_id      {1}
    delivery_fee_id   {1}
    category
    status            {1}
  end
end
