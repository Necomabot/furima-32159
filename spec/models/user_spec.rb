require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "ニックネームと名字（漢字）、名前（漢字）、名字（カタカナ）、名前（カタカナ）、生年月日、メールアドレス、パスワードが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "名字（漢字）が空だと登録できない" do
      @user.last_name_chinese_characters = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name chinese characters can't be blank")
    end

    it "名字（漢字）が全角漢字、ひらがな、カタカナ以外が入力されている場合に登録ができない" do
      @user.last_name_chinese_characters = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name chinese characters is invalid")
    end

    it "名前（漢字）が空だと登録できない" do
      @user.first_name_chinese_characters = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name chinese characters can't be blank")
    end

    it "名前（漢字）が全角漢字、ひらがな、カタカナ以外が入力されている場合に登録ができない" do
      @user.first_name_chinese_characters = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name chinese characters is invalid")
    end

    it "名字（カタカナ）が空だと登録できない" do
      @user.last_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end

    it "名字（カタカナ）が全角カタカナ以外が入力されている場合に登録ができない" do
      @user.last_name_katakana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
    end

    it "名前（カタカナ）が空だと登録できない" do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it "名前（カタカナ）が全角カタカナ以外が入力されている場合に登録ができない" do
      @user.first_name_katakana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
    end

    it "生年月日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


    it "メールアドレスが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したメールアドレスが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスに@が含まれてないと登録できない" do
      @user.email = "samplegmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "パスワードが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user.invalid?).to be true
    end

    it "パスワードが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
