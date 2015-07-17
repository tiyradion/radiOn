class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :album_name
      t.string :song_name
      t.integer :promoter_id
      t.attachment :uploaded_file
      t.attachment :picture_upload_1
      t.attachment :picture_upload_2
      t.attachment :picture_upload_3
      t.attachment :picture_upload_4
      t.attachment :picture_upload_5
      t.timestamps null: false
    end
  end
end
