class Review < ApplicationRecord
  belongs_to :booking
  has_one :planet, through: :booking

  validates :comment, presence: true
  validates :grade, presence: true
  validates :grade, numericality: { only_integer: true, in: (1..5) }
  validates :grade, inclusion: { in: 0..5 }

  def self.user_has_reservation_for_planet?(user, planet)
    Booking.where(user: user, planet: planet).exists?
  end
end
