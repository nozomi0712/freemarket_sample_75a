FactoryBot.define do
  factory :image do
    image   {File.open("#{Rails.root}/public/images/test.jpeg")}
    item    
  end
end
