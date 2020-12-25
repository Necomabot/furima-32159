require 'rails_helper'

RSpec.describe ItemPurchaseShippingAddress, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @item_purchase_shipping_address = FactoryBot.build(:item_purchase_shipping_address,user_id: user.id, item_id: item.id)
    end

    context "登録できる場合" do
      it "token、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば登録できること" do
        expect(@item_purchase_shipping_address).to be_valid
      end

      it "電話番号はハイフンなしで11桁以内だと登録できる" do
        @item_purchase_shipping_address.phone_number = "01234567891"
        expect(@item_purchase_shipping_address).to be_valid
      end
    end

    context "登録できない場合" do
      it "tokenが空では登録できないこと" do
        @item_purchase_shipping_address.token = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では登録できないこと" do
        @item_purchase_shipping_address.postal_code = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "都道府県が空では登録できないこと" do
        @item_purchase_shipping_address.prefecture_id = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市区町村が空では登録できないこと" do
        @item_purchase_shipping_address.municipality = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it "番地が空では登録できないこと" do
        @item_purchase_shipping_address.address = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空では登録できないこと" do
        @item_purchase_shipping_address.phone_number = nil
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "郵便番号にハイフンがないと登録できない" do
        @item_purchase_shipping_address.postal_code = "1234567"
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "電話番号はハイフンありだと登録できない" do
        @item_purchase_shipping_address.phone_number = "012-3456-7891"
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号は12桁以上だと登録できない" do
        @item_purchase_shipping_address.phone_number = "0123456789123"
        @item_purchase_shipping_address.valid?
        expect(@item_purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
