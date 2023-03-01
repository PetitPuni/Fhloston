class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, presence: true
  validates :grade, presence: true
  validates :grade, numericality: { only_integer: true, in: (1..5) }
  validates :grade, inclusion: { in: 0..5 }

  def self.user_has_reservation_for_planet?(user, planet)
    Booking.where("bookings.user_id = ? && bookings.planet_id = ?", user.id, planet.id)
  end
end
