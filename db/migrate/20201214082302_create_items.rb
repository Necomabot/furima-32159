class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                   null: false
      t.text       :explanation,            null: false
      t.integer    :category_id,            null: false
      t.integer    :status_id,              null: false
      t.integer    :shipping_fee_burden_id, null: false
      t.integer    :prefecture_id,          null: false
      t.integer    :days_to_ship_id,        null: false
      t.integer    :price,                  null: false
      t.references :user,                   foreign_key: true

      # name                   :商品名
      # explanation            :商品説明
      # category_id            :カテゴリー
      # status_id              :商品状態
      # shipping_fee_burden_id :送料負担
      # prefecture_id          :都道府県
      # days_to_ship_id        :出荷までの日数
      # price                  :価格

      

      t.timestamps
    end
  end
end