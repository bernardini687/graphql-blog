# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sessions

  validates :first_name, :street, :city, :postcode, :country, presence: true
  validates :number, numericality: { only_integer: true }

  has_secure_password

  def success_payload
    { user: self, errors: [] }
  end

  def failure_payload
    { user: nil, errors: errors.full_messages }
  end
end
