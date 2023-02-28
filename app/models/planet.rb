class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :booking
  has_many_attached :photos

  validates :name, presence: true
  validates :planet_type, presence: true
  validates :catch_phrase, presence: true, length: { minimum: 20 }
  validates :summary, presence: true, length: { in: 100..600 }
  validates :inhabitants,  numericality: { only_integer: true, in: (1..7_000_000_000) }
  validates :available_places, numericality: { only_integer: true, in: (1..5) }
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true, in: (1..20_000) }
end
