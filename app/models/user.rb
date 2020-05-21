class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_address
  has_many :items
  validates :nickname, :birthday, :first_name, :first_furigana, :last_name, :last_furigana ,presence: true
  devise :validatable, password_length: 7..128
end
