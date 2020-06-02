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
    
    after(:create) do |image|
      create_list(:image, 3, item: item)
    end
  end
  
end
