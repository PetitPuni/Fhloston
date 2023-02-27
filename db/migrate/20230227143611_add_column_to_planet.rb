class AddColumnToPlanet < ActiveRecord::Migration[7.0]
  def change
    add_column :planets, :name, :string
  end
end
