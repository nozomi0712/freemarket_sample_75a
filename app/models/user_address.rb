class UserAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates  :post, :preficture, :city, :block, :first_name, :first_furigana, :last_name, :last_furigana, presence: true
  validates :first_furigana, :last_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/, allow_blank: true}
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥一-龥]+\z/, allow_blank: true} 
end
