class RemovePlanetReferenceAndUserReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :user_id
    remove_column :reviews, :planet_id
  end
end
