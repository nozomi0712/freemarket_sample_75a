class UserAddress < ApplicationRecord

  belongs_to :user, optional: true
  validates :post, :preficture, :city, :block, presence: true
end
