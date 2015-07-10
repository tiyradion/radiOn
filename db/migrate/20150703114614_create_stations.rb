class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.attachment :picture_upload
      t.string :station_name
      t.string :phone_number
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
