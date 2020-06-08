class Trade < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :item
end
