# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sessions

  has_secure_password

  validates :first_name, :street, :city, :postcode, :country, presence: true
  validates :number, numericality: { only_integer: true }
  validates :password, length: { minimum: 4 }, allow_nil: true

  def success_payload
    { user: self, errors: [] }
  end

  def failure_payload
    { user: nil, errors: errors.full_messages }
  end
end
