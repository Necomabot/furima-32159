class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[一-龥]+\z/ } do
      validates :last_name_chinese_characters
      validates :first_name_chinese_characters
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
  end

  has_many :items
  has_many :itme_purchases

end
