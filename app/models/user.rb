class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :items
  has_one   :user_address
  devise    :validatable, password_length: 7..128
  validates :nickname, :birthday, :first_name, :first_furigana, :last_name, :last_furigana ,presence: true
  validates :first_furigana, :last_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/, allow_blank: true}
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥一-龥]+\z/, allow_blank: true} 
end
# format: {with: VALID_EMAIL_REGEX, allow_blank: true} 