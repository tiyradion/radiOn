class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :rank
      t.integer :station_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
