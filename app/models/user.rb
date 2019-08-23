class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :first_name, :street, :city, :postcode, :country, presence: true
  validates :number, numericality: { only_integer: true }
end
