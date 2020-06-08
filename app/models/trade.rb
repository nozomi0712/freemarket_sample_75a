class Trade < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :item

  validates :seller_id, presence: true
end
