class ShippingFeeBurden < ActiveHash::Base
  self.data = [
    { id: 1, shipping_fee_burden: '---' },
    { id: 2, shipping_fee_burden: '着払い（購入者負担）' },
    { id: 3, shipping_fee_burden: '送料込み（出品者負担）' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end
