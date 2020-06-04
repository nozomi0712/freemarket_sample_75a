FactoryBot.define do
  factory :image do
    image   {File.open("spec/fixtures/test.jpeg")}
  end
end
