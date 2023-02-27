class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :planet_type
      t.string :summary
      t.integer :inhabitants
      t.integer :available_places
      t.string :location
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
