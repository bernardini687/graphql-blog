class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :first_name, :street, :city, :postcode, :country, presence: true
  validates :number, numericality: { only_integer: true }

  def success_payload
    { user: self, errors: [] }
  end

  def failure_payload
    { user: nil, errors: errors.full_messages }
  end
end
