class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  has_one :review


  scope :upcomming, -> { where('start_date >= ?', DateTime.now) }
  scope :past, -> { where('start_date < ?', DateTime.now) } #only before the datetime now
end
def reservation_date_cannot_be_in_the_past
  if date < date.today
    errors.add(:date, "vous ne pouvez reserver de planète à une date passée")
  end
end
