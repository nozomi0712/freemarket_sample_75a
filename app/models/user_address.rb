class UserAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates  :post, :preficture, :city, :block, :first_name, :first_furigana, :Last_name, :Last_furigana, presence: true
end
