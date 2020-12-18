FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {Faker::String.random}
    category_id {1}
    status_id {1}
    shipping_fee_burden_id {1}
    prefecture_id {1}
    days_to_ship_id {1}
    price {Faker::Alphanumeric.random}
  end
end
