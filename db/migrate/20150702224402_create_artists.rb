class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :album_name
      t.string :song_name
      t.integer :promoter_id
      t.string :uploaded_file
      t.timestamps null: false
    end
  end
end
