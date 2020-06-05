class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_date
  belongs_to_active_hash :brand
  has_many :images
  has_one :trade
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :item_name, :explanation,:price,:condition,:ship_date,:delivery_fee,  presence: true
  validates :images, length: { minimum: 1, maximum: 10 }
  validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  has_one    :trade
  has_many   :images
end
