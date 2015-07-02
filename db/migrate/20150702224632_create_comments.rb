class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :artist_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
