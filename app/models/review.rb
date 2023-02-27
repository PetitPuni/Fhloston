class Review < ApplicationRecord
  belongs_to :planet
  belongs_to :user
end
