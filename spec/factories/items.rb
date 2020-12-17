FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {Faker::String.random}
    category_id {Faker::String.random}
    status_id {Faker::String.random}
    shipping_fee_burden_id {Faker::String.random}
    prefecture_id {Faker::String.random}
    days_to_ship_id {Faker::String.random}
    price {Faker::Alphanumeric.alpha(number: 300)}
  end
end
