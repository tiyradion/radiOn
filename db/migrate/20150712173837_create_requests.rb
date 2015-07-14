class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :requested
      t.integer :artist_id
      t.integer :station_id

      t.timestamps null: false
    end
  end
end
