FactoryBot.define do
  factory :item_purchase_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {2}
    municipality {"横浜市緑区"}
    address {"青山1-1-1"}
    phone_number {"01234567891"}
    building_name {"柳ビル123"}
  end
end
