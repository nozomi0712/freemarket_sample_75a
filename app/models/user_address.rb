class UserAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates  :post, :preficture, :city, :block, :first_name, :first_furigana, :Last_name, :Last_furigana, presence: true
  validates :first_furigana, :Last_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/,
  message: "には全角で入力してください。"}
# 漢字規制
  validates :first_name, :Last_name, format: { with: /\A[ぁ-んァ-ン一-龥一-龥]+\z/,
              message: "には全角漢字で入力してください。"} 
end
