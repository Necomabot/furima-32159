class ShippingAddress < ApplicationRecord
  belongs_to :item_purchase
end
