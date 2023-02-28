class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :booking
end
