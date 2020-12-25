class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building_name  
      t.string     :phone_number,  null: false
      t.references :item_purchase, foreign_key: true
      # postal_code   :郵便番号
      # prefecture_id :都道府県
      # municipality  :市区町村
      # address       :番地
      # building_name :建物名
      # phone_number  :電話番号
      t.timestamps
    end
  end
end
