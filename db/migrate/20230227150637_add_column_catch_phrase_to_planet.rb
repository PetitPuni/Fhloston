class AddColumnCatchPhraseToPlanet < ActiveRecord::Migration[7.0]
  def change
    add_column :planets, :catch_phrase, :string
  end
end
