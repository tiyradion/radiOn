class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.boolean :request
      t.integer :artist_id
      t.integer :station_id

      t.timestamps null: false
    end
  end
end
