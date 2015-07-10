class CreatePromoters < ActiveRecord::Migration
  def change
    create_table :promoters do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :company_name
      t.attachment :picture_upload

      t.timestamps null: false
    end
  end
end
