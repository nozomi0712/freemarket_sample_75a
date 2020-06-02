class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  nas_one    :trade
  has_many   :images
end
