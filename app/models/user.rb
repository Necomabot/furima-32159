class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                      presence: true
  validates :last_name_chinese_characters,  presence: true
  validates :first_name_chinese_characters, presence: true
  validates :last_name_katakana,            presence: true
  validates :first_name_katakana,           presence: true
  validates :birthday,                      presence: true

  has_many :items
  has_many :itme_purchases

end
