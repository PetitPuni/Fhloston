class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  validates :start_date, uniqueness: true

  scope :upcomming, -> { where('start_date >= ?', DateTime.now) }
  scope :past, -> { where('start_date <= ?', DateTime.now) }
end
