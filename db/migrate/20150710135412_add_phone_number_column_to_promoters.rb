class AddPhoneNumberColumnToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :phone_number, :string
  end
end
