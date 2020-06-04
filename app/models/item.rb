class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  has_one    :trade
  has_many   :images
end
