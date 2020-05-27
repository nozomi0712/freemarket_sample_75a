class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items
  has_one   :user_address
  devise    :validatable, password_length: 7..128
  validates :nickname, :birthday, :first_name, :first_furigana, :last_name, :last_furigana ,presence: true

  validates :first_furigana, :last_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/,
                         message: "には全角で入力してください。"}
  # 漢字規制
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥一-龥]+\z/,
                                     message: "には全角漢字で入力してください。"} 


  # validates :first_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/}
  # validates :last_name, format: { with: /\A[ぁ-んァ-ヶー－]+\z/}
  # validates :last_furigana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/}

  # 漢字規制
  # validates :first_name, :last_name, format: { with: /^[ぁ-んァ-ン一-龥]/,
  #   message: "には全角で入力してください。記号は使用できません。"} 
end
