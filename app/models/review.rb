class Review < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :comment, presence: true
  validates :grade, presence: true
  validates :grade, numericality: { only_integer: true }
  validates :grade, inclusion: { in: 0..5 }
end
