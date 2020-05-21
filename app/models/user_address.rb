class UserAddress < ApplicationRecord

  belongs_to :user, optional: true
end
