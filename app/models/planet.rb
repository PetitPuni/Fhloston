class Planet < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  # validates :name, presence: true
  # validates :planet_type, presence: true
  # validates :catch_phrase, presence: true
  # validates :summary, presence: true
  # validates :inhabitants,  numericality: { only_integer: true, in: (1..2_000_000_000) }
  # validates :available_places, numericality: { only_integer: true, in: (1..5) }
  # validates :location, presence: true
  # validates :price, presence: true, numericality: { only_integer: true, in: (1..20_000) }



  include PgSearch::Model
  pg_search_scope :search_planet,
                  against: %i[name planet_type available_places location summary],
                  using: {
                    tsearch: { prefix: true }
                  }
end
