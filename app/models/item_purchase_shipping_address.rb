class ItemPurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :token
    with_options format: {with: /\A\d{11}\z/ } do
      validates :phone_number
    end
    with_options format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ } do
      validates :postal_code
    end
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number:phone_number, item_purchase_id: item_purchase.id)
  end
end
