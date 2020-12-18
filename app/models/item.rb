class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image

    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price
    end

   

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_burden_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

 
  belongs_to       :user
  has_one          :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
end


