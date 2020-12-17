require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item =FactoryBot.build(:user)
    end

    context "登録できる場合" do
      it "商品画像を１枚と商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すれば登録できること" do
        expect(@item).to be_valid
      end

      it "価格の範囲が、¥300~¥9,999,999の間であれば保存できること" do
        @item.price = "300"
        expect(@item).to be_valid
      end
    end


    context "登録できない場合" do
      it "商品画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category id can't be blank")
      end

      it "商品状態が空だと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status id can't be blank")
      end

      it "配送料の負担が空だと登録できない" do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden id can't be blank")
      end

      it "発送元の地域が空だと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture id can't be blank")
      end

      it "発送までの日数が空だと登録できない" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship id can't be blank")
      end

      it "価格が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格の範囲が¥300~¥9,999,999以外が入力されている場合に登録できない" do
        @user.price = "100"
        @user.valid?
        expect(@item.errors.full_messages).to include("Price is too short (minimum is ¥300 characters")
      end

      it "販売価格が半角数字以外が入力されている場合に登録できない" do
        @user.price = "１００"
        @user.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end

  end
end
