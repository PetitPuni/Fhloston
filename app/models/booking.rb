class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  scope :upcomming, -> { where('start_date >= ?', DateTime.now) }
  scope :past, -> { where('start_date <= ?', DateTime.now) }
end
