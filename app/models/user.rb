class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items
  has_many  :trades
  has_one   :user_address
  has_one   :card, dependent: :destroy
  devise    :validatable, password_length: 7..128
  validates :nickname, :birthday, :first_name, :first_furigana, :last_name, :last_furigana ,presence: true
end
