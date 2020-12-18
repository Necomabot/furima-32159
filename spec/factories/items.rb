FactoryBot.define do
  factory :item do
    name {"商品の名前"}
    explanation {"商品の説明"}
    category_id {2}
    status_id {2}
    shipping_fee_burden_id {2}
    prefecture_id {2}
    days_to_ship_id {2}
    price {300}
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
    association :user
  end
end
